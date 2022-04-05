 import Foundation

let RGB = 3
let INF = 987654321
let range = 0..<RGB
let N = Int(readLine()!)!
var map: [[Int]] = []
var dp: [[[Int]]] = []
for _ in 0..<N {
    map.append(readLine()!.split(separator: " ").map{Int(String($0))!})
}
dp = [[[Int]]](repeating: [[Int]](repeating: [Int](repeating: INF, count: RGB), count: N), count: RGB)

func solve() {
    for i in range {
		for j in range {
			if i == j { continue }
			dp[i][1][j] = map[0][i] + map[1][j]
		}
	}

	for k in range {
		for i in 2..<N {
			for j in range {
				dp[k][i][j] = min(dp[k][i - 1][(j + 1) % RGB], dp[k][i - 1][(j + 2) % RGB]) + map[i][j];
			}
		}
	}
}

func extractAnswer() -> Int {
	var ret = INF;
	for i in range {
		for j in range {
			if i == j { continue; }
			ret = ret > dp[i][N - 1][j] ? dp[i][N - 1][j] : ret;
		}
	}
	return ret;
}

solve()
print(extractAnswer())
