import Foundation

func indexCatcher(_ stk: [Character]) -> Int {
    for i in (0..<stk.count).reversed() {
        if stk[i] == "0" { return i }
    }
    return -1
}

func exclusive110 (_ stk: inout [Character], _ index: inout Int, _ str: String) {
    for c in str {
        stk.append(c)
        if stk.count >= 3 {
            let len = stk.count - 1
            if stk[len] == "0", stk[len - 1] == "1", stk[len - 2] == "1" {
                index += 1
                stk.popLast()!
                stk.popLast()!
                stk.popLast()!
            }
        }
    }
}

func noHaveZero(_ index: Int, _ stk: [Character]) -> String {
    var result = ""
    var idx = index
    while idx > 0 {
        result += "110"
        idx -= 1
    }
    result += String(stk)
    return result
}

func haveZero(_ index: Int, _ stk: [Character], _ zeroPosi: Int) -> String {
    var result = ""
    var idx = index
    
    for j in 0..<stk.count {
        if j == zeroPosi {
            result += String(stk[j])
            while idx > 0 { result += "110"; idx -= 1}
        }
        else { result += String(stk[j]) }
    }
    
    return result
}

func solution(_ s:[String]) -> [String] {
    var answer: [String] = []
    for str in s {
        var index = 0
        var stk: [Character] = []
        exclusive110(&stk, &index, str)
        
        let zeroPosi = indexCatcher(stk)
        
        if zeroPosi == -1 {
            answer.append(noHaveZero(index, stk))
        }
        else {
            answer.append(haveZero(index, stk, zeroPosi))
        }
        
    }
    return answer
}
