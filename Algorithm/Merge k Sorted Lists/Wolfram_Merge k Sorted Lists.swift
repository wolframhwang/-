/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */
class Solution {
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {        
        return merge_sort(lists, 0, lists.count - 1)
    }

    func merge(_ left: ListNode?, _ right: ListNode?) -> ListNode? {
        var head: ListNode? = ListNode(0, nil)
        var ll = left
        var rr = right
        let ret = head

        while ll != nil && rr != nil {
            guard let lv = ll?.val, let rv = rr?.val else { return nil }
            if lv <= rv {
                head?.next = ll
                ll = ll?.next
            }else {
                head?.next = rr
                rr = rr?.next
            }
            head = head?.next
        }

        while ll != nil {
            head?.next = ll
            head = head?.next
            ll = ll?.next
        }

        while rr != nil {
            head?.next = rr
            head = head?.next
            rr = rr?.next
        }
        return ret?.next
    }

    func merge_sort(_ lists: [ListNode?], _ left: Int ,_ right: Int) -> ListNode?{
        let mid = (left + right) / 2
        var ret: ListNode? = nil
        if left < right {
            let l = merge_sort(lists, left, mid)
            let r = merge_sort(lists, mid + 1, right)
            ret =  merge(l, r)
        }
        else if left == right {
            ret = lists[left]
        }        
        return ret
    }

}
