
class Node {
    var value: Int
    var next: Node?
    init(_ value: Int, _ next: Node?) {
        self.value = value
        self.next = next
    }
    init(_ value: Int) {
        self.value = value
        self.next = nil
    }
    init() {
        self.value = 0
        self.next = nil
    }
}

class MyHashSet {
    let DIV = (1 << 14)
    var map: [Node?] = []
    
    init() {
        for i in 0..<DIV {
            let node = Node(-(i + 1))
            map.append(node)
        }
    }
    
    func add(_ key: Int) {
        let k = key % DIV
        var nodeSearch = map[k]

        while nodeSearch != nil {
            if nodeSearch?.value == key {
                return
            }
            nodeSearch = nodeSearch?.next
        }
        let inputNode = Node(key, map[k]?.next)
        map[k]?.next = inputNode
    }
    
    func remove(_ key: Int) {
        let k = key % DIV
        var nodeSearch = map[k]

        while nodeSearch?.next != nil {
            if nodeSearch?.next?.value == key {
                nodeSearch?.next = nodeSearch?.next?.next
                return
            } 
            nodeSearch = nodeSearch?.next
        }
    }
    
    func contains(_ key: Int) -> Bool {
        let k = key % DIV
        var nodeSearch = map[k]

        while nodeSearch != nil {
            if nodeSearch?.value == key {                
                return true
            }
            nodeSearch = nodeSearch?.next
        }
        return false
    }
}

/**
 * Your MyHashSet object will be instantiated and called as such:
 * let obj = MyHashSet()
 * obj.add(key)
 * obj.remove(key)
 * let ret_3: Bool = obj.contains(key)
 */Design HashSet
