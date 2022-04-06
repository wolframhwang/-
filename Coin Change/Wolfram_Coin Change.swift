class Solution {
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        let MX = amount + 1
		var dp = [Int](repeating: MX, count: MX)
		dp[0] = 0
		for i in 0..<dp.count {
			for coin in coins {
				if i - coin < 0 { continue }
				dp[i] = min(dp[i], dp[i-coin]+1)
			}
		}
		return dp[amount] == MX ? -1 : dp[amount]
	}
}
