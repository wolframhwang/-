class Solution {
    var parent: [Int] = []
    var links: [(Int, Int, Int)] = []

    func parentInitialization(_ people: Int) {
        for i in 0...people {
            parent.append(i);
        }
    }

    func getParent(_ a: Int) -> Int {
        if a == parent[a] { return a }
        parent[a] = getParent(parent[a])
        return parent[a]
    }

    func findParent(_ a: Int, _ b: Int) -> Bool {
        let a = getParent(a)
        let b = getParent(b)
        if a == b { return true }
        return false
    }

    func unionParent(_ a: Int, _ b: Int) {
        let a = getParent(a)
        let b = getParent(b)
        if a < b {
            parent[b] = a
        } else {
            parent[a] = b
        }
        
    }

    func minCostConnectPoints(_ points: [[Int]]) -> Int {
        var answer = 0

        parentInitialization(points.count)
        let range = 0..<points.count

        for i in range {
            let range2 = (i + 1)..<points.count
            for j in range2 {
                let distance = abs(points[i][0] - points[j][0]) + abs(points[i][1] - points[j][1])
                links.append((i, j, distance))
            }
        }
        links = links.sorted{ $0.2 < $1.2 }

        for link in links {
            let a = link.0
            let b = link.1
            let distance = link.2
            if findParent(a, b) == false {
                unionParent(a, b)
                answer += distance
            }
        }
        return distance
    }
}
