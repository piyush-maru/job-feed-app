# interview_prectical

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

1. Arrays
   🔹 Problem:
   Given an integer array nums, return the maximum subarray sum (contiguous).
   👉 Example: [−2,1,−3,4,−1,2,1,−5,4] → 6 ([4,−1,2,1]).
   • Expected solution: Kadane’s Algorithm (O(n)).
   • Follow-up: Modify it to also return the indices of the subarray.

void main() {
 List<int> nums = [-2, 1, -3, 4, -1, 2, 1, -5, 4];

  var result = maxSubArray(nums);
  print("Maximum Sum: ${result['sum']}");
  print("Subarray Indices: [${result['start']}, ${result['end']}]");
  print("Subarray: ${nums.sublist(result['start'], result['end'] + 1)}");
}

 /// Kadane's Algorithm with indices
 Map<String, dynamic> maxSubArray(List<int> nums) {
 int maxSum = nums[0];
 int currentSum = nums[0];

 int start = 0, end = 0, tempStart = 0;

 for (int i = 1; i < nums.length; i++) {
     if (currentSum + nums[i] < nums[i]) {
     currentSum = nums[i];
     tempStart = i;
 } else {
      currentSum += nums[i];
 }

    if (currentSum > maxSum) {
      maxSum = currentSum;
      start = tempStart;
      end = i;
    }
}

 return {
  'sum': maxSum,
  'start': start,
  'end': end,
 };
}

////-----2-------
2. Hashing / Strings
   🔹 Problem:
   Find the longest substring without repeating characters.
   👉 Example: "abcabcbb" → 3 ("abc").
   • Expected: Use sliding window + hash set/map.
   • Tests hashing, two pointers, and optimal thinking.

void main() {

 final tests = [
    "abcabcbb",
    "bbbbb",
    "pwwkew",
    "",
    "dvdf",
    "anviaj"
   ];

 for (var s in tests) {
       final res = longestUniqueSubstring(s);
          print('Input: "$s" -> length: ${res['length']}, substring: "${res['substring']}", indices: [${res['start']}, ${res['end']}]');
     }
 }

 Map<String, dynamic> longestUniqueSubstring(String s) {
 if (s.isEmpty) {
      return {'length': 0, 'start': -1, 'end': -1, 'substring': ''};
  }

 final Map<String, int> lastSeen = {}; // char -> last index where it appeared
   int start = 0;       // window start
   int maxLen = 0;
   int maxStart = 0;

 for (int i = 0; i < s.length; i++) {
    final ch = s[i];

    // If we've seen ch inside the current window, move start right after its last position
    if (lastSeen.containsKey(ch) && lastSeen[ch]! >= start) {
      start = lastSeen[ch]! + 1;
    }

    // update last seen index for ch
    lastSeen[ch] = i;

    // check current window length
    final currLen = i - start + 1;
    if (currLen > maxLen) {
      maxLen = currLen;
      maxStart = start;
    }
}

 final substring = s.substring(maxStart, maxStart + maxLen);
   return {
      'length': maxLen,
       'start': maxStart,
       'end': maxStart + maxLen - 1,
       'substring': substring,
   };
 }

////---------3--------

3. Stack
   🔹 Problem:
   Given an array, for each element find the next greater element to its right.
   👉 Example: [4,5,2,25] → [5,25,25,-1].
   • Expected: Use a monotonic stack.
   • Tests: Stack understanding & optimization beyond brute force.


void main() {
 List<int> nums = [4, 5, 2, 25];
 print("Input: $nums");
 print("Next Greater Elements: ${nextGreaterElements(nums)}");


 print(nextGreaterElements([13, 7, 6, 12])); // [ -1, 12, 12, -1 ]
 print(nextGreaterElements([1, 3, 2, 4]));   // [ 3, 4, 4, -1 ]
}


 List<int> nextGreaterElements(List<int> nums) {
 int n = nums.length;
 List<int> result = List.filled(n, -1);
 List<int> stack = []; // will store indices

 for (int i = 0; i < n; i++) {
    while (stack.isNotEmpty && nums[i] > nums[stack.last]) {
    int index = stack.removeLast();
   result[index] = nums[i];
 }
 stack.add(i);
 }
  return result;
}

////-------4--------------

4. Linked List
   🔹 Problem:
   Detect if a linked list has a cycle. If yes, return the node where the cycle begins.
   • Expected: Floyd’s cycle detection algorithm (Tortoise & Hare).
   • Follow-up: Can you solve without extra memory?

void main() {

  ListNode head = ListNode(3);
  head.next = ListNode(2);
  head.next!.next = ListNode(0);
  head.next!.next!.next = ListNode(-4);


 head.next!.next!.next!.next = head.next;

 ListNode? cycleNode = detectCycle(head);

 if (cycleNode != null) {
       print("Cycle detected at node with value: ${cycleNode.val}");
   } else {
       print("No cycle detected.");
   }
 }


 class ListNode {
   int val;
   ListNode? next;
   ListNode(this.val);
 }


 ListNode? detectCycle(ListNode? head) {
  if (head == null) return null;

  ListNode? slow = head;
  ListNode? fast = head;


 while (fast?.next != null && fast?.next?.next != null) {
 slow = slow!.next;
 fast = fast!.next!.next;

    if (slow == fast) {
      // Step 2: Find cycle entry point
      ListNode? p1 = head;
      ListNode? p2 = slow;

      while (p1 != p2) {
        p1 = p1!.next;
        p2 = p2!.next;
      }
      return p1; // cycle start node
    }
 }
 return null; 
}


////--------5----------

5. Trees
   🔹 Problem:
   Find the lowest common ancestor (LCA) of two nodes in a binary search tree.
   👉 Example: For nodes p=2 and q=8, return 6.
   • Expected: BST property based traversal.
   • Follow-up: Modify for a general binary tree (without BST property).


void main() {

  TreeNode root = TreeNode(6);
    root.left = TreeNode(2);
    root.right = TreeNode(8);
    root.left!.left = TreeNode(0);
    root.left!.right = TreeNode(4);
    root.left!.right!.left = TreeNode(3);
    root.left!.right!.right = TreeNode(5);
    root.right!.left = TreeNode(7);
    root.right!.right = TreeNode(9);

TreeNode p = root.left!;      // Node 2
TreeNode q = root.right!;     // Node 8

TreeNode? lca1 = lowestCommonAncestorBST(root, p, q);
print("BST LCA of ${p.val} and ${q.val} is: ${lca1?.val}");


TreeNode node3 = root.left!.right!.left!;  // Node 3
TreeNode node5 = root.left!.right!.right!; // Node 5
TreeNode? lca2 = lowestCommonAncestorBT(root, node3, node5);
print("General BT LCA of ${node3.val} and ${node5.val} is: ${lca2?.val}");
}


class TreeNode {
int val;
TreeNode? left;
TreeNode? right;
TreeNode(this.val);
}


 TreeNode? lowestCommonAncestorBST(TreeNode? root, TreeNode p, TreeNode q) {
 while (root != null) {
  if (p.val < root.val && q.val < root.val) {
    root = root.left;
   } else if (p.val > root.val && q.val > root.val) {
 root = root.right;
    } else {
      return root; // split point -> LCA
 }
} 
return null;
}


TreeNode? lowestCommonAncestorBT(TreeNode? root, TreeNode p, TreeNode q) {
if (root == null || root == p || root == q) return root;

TreeNode? left = lowestCommonAncestorBT(root.left, p, q);
TreeNode? right = lowestCommonAncestorBT(root.right, p, q);

if (left != null && right != null) return root; // p & q in diff sides
return left ?? right;
}


///////--------6------
6. Graphs
   🔹 Problem:
   Given a 2D grid of '1' (land) and '0' (water), count the number of islands.
   👉 Example:
   11110
   11010
   11000
   00000
   Output → 1
   • Expected: Solve with DFS or BFS.
   • Tests recursion, graph traversal, and problem-solving.

void main() {
   List<List<String>> grid = [
     ['1','1','1','1','0'],
     ['1','1','0','1','0'],
     ['1','1','0','0','0'],
     ['0','0','0','0','0']
   ];

print("Number of Islands: ${numIslands(grid)}");


List<List<String>> grid2 = [
   ['1','1','0','0','0'],
   ['1','1','0','0','0'],
   ['0','0','1','0','0'],
   ['0','0','0','1','1']
];
print("Number of Islands: ${numIslands(grid2)}"); // Expected 3
}


 int numIslands(List<List<String>> grid) {
 if (grid.isEmpty) return 0;
 int rows = grid.length;
 int cols = grid[0].length;
 int count = 0;

void dfs(int r, int c) {
 if (r < 0 || c < 0 || r >= rows || c >= cols || grid[r][c] == '0') {
 return;
}
 grid[r][c] = '0'; // mark visited
 dfs(r + 1, c);
 dfs(r - 1, c);
 dfs(r, c + 1);
 dfs(r, c - 1);
}

 for (int r = 0; r < rows; r++) {
  for (int c = 0; c < cols; c++) {
    if (grid[r][c] == '1') {
        count++;
     dfs(r, c);
   }
  }
 }

return count;
}
