class Solution {
public:
    vector<int> maxSlidingWindow(vector<int>& nums, int k) {
        int n = nums.size(), maximum, left = 0, right = k - 1;
        vector<int> result;
        deque<int> dq;
        for (int i = 0; i < n; i++) {
            while (!dq.empty() and dq.front() < i - (k - 1)) dq.pop_front();
            while (!dq.empty() and nums[dq.back()] < nums[i]) dq.pop_back();
            dq.push_back(i);
            if (i >= k - 1) result.push_back(nums[dq.front()]);
        }
        return result;
    }
};
