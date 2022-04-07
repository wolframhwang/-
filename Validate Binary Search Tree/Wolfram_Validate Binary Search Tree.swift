/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }

 [5,4,6,null,null,3,7]
 */
class Solution {
    func isValidBST(_ root: TreeNode?) -> Bool {
		return recur(root, Int.min, Int.max)
    }

	func recur(_ node: TreeNode?, _ minVal: Int, _ maxVal: Int) -> Bool {
		guard let val = node?.val else { return true }
		return val > minVal && val < maxVal && recur(node?.left, minVal, val) && recur(node?.right, val, maxVal)
	}
}
