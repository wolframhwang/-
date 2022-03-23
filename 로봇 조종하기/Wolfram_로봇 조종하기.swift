import Foundation

let DIR = 3
let INF = -987654321
let NM = readLine()!.split(separator: " ").map{Int(String($0))!}
let N = NM[0]
let M = NM[1]
var dp: [[[Int]]] = []
var map: [[Int]] = []
func input() {
    for i in 0..<N {
        let arr = readLine()!.split(separator: " ").map{Int(String($0))!}
        map.append(arr)
    }
}
func makeDP() {
    dp = [[[Int]]](repeating: [[Int]](repeating: [Int](repeating: INF, count: M + 10), count: N + 10), count: DIR)
}

func solve() {
    dp[1][0][0] = map[0][0]
    dp[0][0][0] = map[0][0]

    for i in 1..<N {
        dp[1][i][0] = max(dp[0][i - 1][0], max(dp[1][i - 1][0], dp[2][i - 1][0])) + map[i][0];

		for j in 1..<M {
			dp[0][i][j] = max(dp[0][i][j - 1], dp[1][i][j - 1]) + map[i][j];
			dp[1][i][j] = max(max(dp[0][i - 1][j], dp[1][i - 1][j]), dp[2][i - 1][j]) + map[i][j];
		}

		for j in (0..<M-1).reversed() {
			dp[2][i][j] = max(dp[1][i][j + 1], dp[2][i][j + 1]) + map[i][j];
		}
    }

    print(max(dp[0][N - 1][M - 1], max(dp[1][N - 1][M - 1], dp[2][N - 1][M - 1])))
}
input()
makeDP()
solve()
