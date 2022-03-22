import Foundation
let DIV = 10007

func _main() {
    let N = Int(readLine()!)!
    var dp: [Int] = [Int](repeating: 0, count: N + 1)    
    
    dp[0] = 1
    dp[1] = 1
    dp[2] = 3
    for i in 3...N {
        dp[i] = (dp[i - 1] % DIV + 2 * dp[i - 2] % DIV) % DIV
    }
    print(dp[N])
}

_main()
