import Foundation

let NM = readLine()!.split(separator: " ").map{Int(String($0))!}
let N = NM[0]
let M = NM[1]

var len = 0
var matrix: [[Character]] = []
for i in 0..<N {
    let str = String(readLine()!)
    matrix.append([])
    for c in str {
        matrix[i].append(c)
    }
}

var dp : [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: M + 1), count: N + 1)
for i in 1...N {
    for j in 1...M {
        if matrix[i - 1][j - 1] == "1" {
            dp[i][j] = min(min(dp[i][j - 1], dp[i - 1][j]), dp[i - 1][j - 1]) + 1                    
            len = max(len, dp[i][j])
        }
    }
}
print(len * len)
