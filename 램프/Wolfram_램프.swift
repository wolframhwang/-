let NM = readLine()!.split(separator : " " ).map{Int(String($0))!}
let N = NM[0]
let M = NM[1]

var cnt = 0
var map: [[Int]] = [[Int]](repeating: [], count: N)
var refCnt: [Int] = [Int](repeating: 0, count: M)

for i in 0..<N {
    let line = readLine()!
    for c in line {
        map[i].append(Int(String(c))!)
    }
}
let K = Int(readLine()!)!

func checker(_ cnt: Int) -> Bool {
	if cnt <= K { 
		if (K - cnt) % 2 == 0 { return true }
		return false
	}
	return false
}

func solve() -> Int {
	var ret = 0
	let rangeRow = 0..<N
	let rangeCol = 0..<M

	for i in rangeRow {
		var index = 0
		var cnt = 0
		for j in rangeCol {
			if map[i][j] == 0 { refCnt[j] = 1; index += 1 }
			else { refCnt[j] = 0}
		}

		if !checker(index) { continue }

		for j in rangeRow {
			var OK = true
			for k in rangeCol {
				if (map[j][k] + refCnt[k]) % 2 == 0 { OK = false; break; }				
			}
			if (OK) { cnt += 1}
		}
		ret = cnt > ret ? cnt: ret
	}
	return ret
}

print(solve())
