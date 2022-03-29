import Foundation

let N = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map{Int(String($0))!}

var dp : [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: 21), count: N + 1)

dp[0][arr[0]] = 1

for i in 1..<(N - 1) {
    for j in 0...20 {
        if j + arr[i] <= 20 {
            dp[i][j + arr[i]] += dp[i - 1][j]
        }
        if j - arr[i] >= 0 {
            dp[i][j - arr[i]] += dp[i - 1][j]
        }
    }
}
print(dp[N - 2][arr[N - 1]])

