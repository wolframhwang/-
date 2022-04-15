let N = Int(readLine()!)!
let arr = readLine()!.split(separator : " " ).map{Int(String($0))!}
let range = 1..<N

var dp: [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: N), count: 2)

var ret = arr[0]
dp[0][0] = arr[0]
for i in range {
	dp[0][i] = max(dp[0][i - 1] + arr[i], arr[i])
	dp[1][i] = max(dp[1][i - 1] + arr[i], dp[0][i - 1])
	if ret < dp[1][i] { ret = dp[1][i] }
	if ret < dp[0][i] { ret = dp[0][i] }	
}

print("\(ret)")
