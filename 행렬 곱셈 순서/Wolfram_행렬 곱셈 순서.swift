import Foundation

let INF = 987654321

let N = Int(readLine()!)!

var map: [[Int]] = []
var dp : [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: N + 10), count: N + 10)

for i in 0..<N {
    map.append(readLine()!.split(separator: " ").map{Int(String($0))!})
}

for i in 0..<N {
    for j in 0..<(N-i) {
        if i == 0 { dp[j][j + i] = 0 }
        else {
            dp[j][j + i] = INF
            for k in j..<(j + i) {
                dp[j][j + i] = min(dp[j][j + i],
                dp[j][k] + dp[k + 1][j + i] + 
                (map[j][0] * map[k][1] * map[j + i][1]))
            }
        }
    }
}

print(dp[0][N - 1])

