
class BSTIterator {
	var node: TreeNode?
	var cnt: [Int] = []
	var index = 0

    init(_ root: TreeNode?) {
        self.node = root
		recur(self.node)
    }

	func recur(_ node: TreeNode?) {
		if node == nil { return }
		recur(node?.left)
		cnt.append(node?.val ?? 0)
		recur(node?.right)
	}
    
    func next() -> Int {
        let ret = cnt[index]
		index += 1
		return ret
    }
    
    func hasNext() -> Bool {
        return index != cnt.count
    }
}
