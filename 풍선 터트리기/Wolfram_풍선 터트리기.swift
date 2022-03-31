import Foundation

func solution(_ a:[Int]) -> Int {
    if a.count == 1 { return 1}

    let INF = 0
    var minArr: [[Int]] = [[Int]](repeating: [Int](repeating: INF, count: a.count), count : 2)
    var last = a.count - 2
    var answer = 2

    minArr[0][0] = a[0]
    minArr[1][a.count - 1] = a[a.count - 1]
    for i in 1..<a.count {
        minArr[0][i] = min(minArr[0][i - 1], a[i])
        minArr[1][last] = min(minArr[1][last + 1], a[last])

        last -= 1
    }
    //for i in minArr{ print(i)}

    for i in 1..<a.count-1 {
        if minArr[0][i - 1] < a[i], minArr[1][i + 1] < a[i] { continue }
        answer += 1
    }


    return answer
}
