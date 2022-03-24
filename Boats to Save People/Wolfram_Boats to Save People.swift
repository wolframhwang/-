class Solution {
    func numRescueBoats(_ people: [Int], _ limit: Int) -> Int {        
        var answer = 0
        let p = people.sorted { $0 < $1 }
        var p1 = 0
        var p2 = people.count - 1

        while p1 < p2 {
            if p[p1] + p[p2] <= limit {
                answer += 1
                p1 += 1
                p2 -= 1
            }else {
                answer += 1
                p2 -= 1
            }
        }
        if p1 == p2 {
            answer += 1
        }
        return answer
        
    }
}
