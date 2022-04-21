import Foundation

func solution(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
    var map: [String: Set<String>] = [:]
    var mtm: [String: Int] = [:]
    var expire: [Int] = [Int](repeating: 0, count: id_list.count)
    
    for s in id_list {
        map[s] = []
    }

    for rep in report {
        let bandwave = rep.split(separator: " ")
        for i in 1..<bandwave.count {
            map[String(bandwave[i]), default: []].insert(String(bandwave[0]))
        }
    }
    
    for id in id_list {
        if map[id, default: []].count >= k {
            for banid in map[id, default: []] {
                mtm[banid, default: 0] += 1
            }
        }
    }

    var index = 0

    for id in id_list {
        expire[index] = mtm[id, default: 0]
        index += 1
    }

    return expire
}
