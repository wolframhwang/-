import Foundation

let DIR = 3
let MAX = 8001
let CMAX = 801

let LG = readLine()!.split(separator: " ").map{Int(String($0))!}
let L = LG[0]
let G = LG[1]
let A = readLine()!.split(separator: " ").map{Int(String($0))!}
var arr = [0] + A
var dp : [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: MAX), count: CMAX)
var AC = [Int](repeating: 0, count: MAX)

for i in 1...L {
    AC[i] = AC[i - 1] + arr[i]
    dp[1][i] = AC[i] * i
}

for i in 2...G {
    solve(i, 1, L, 0, L)
}

print(dp[G][L])

func solve(_ ret: Int, _ start: Int, _ end: Int, _ left: Int, _ right: Int) {
    if start > end { return }
    let mid = (start + end) / 2
    var pivot = -1

    for i in left..<(min(right, mid)) {
        let val = dp[ret - 1][i] + (mid - i) * (AC[mid] - AC[i])
        if pivot == -1 || dp[ret][mid] > val {
            pivot = i
            dp[ret][mid] = val
        }
    }

    solve(ret, start, mid - 1, left, pivot + 1)
    solve(ret, mid + 1, end, pivot, right)
}
