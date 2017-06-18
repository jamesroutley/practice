# Algorithms

## Time Complexity

- For recursive functions with multiple branches, time complexity is typically
    O(branches^depth)
- For nested loops where the inner loop `j` runs `n-i` times, complexity is
    O(N^2). `j` runs `N-1, N-2, ..., 2, 1` times. Arithmetic sum = 
    `N(N-1)/2`
- Be aware of problems contianing two different input sizes. The following has
    complexity O(ab), not O(n^2):
    ```python
    for i in len(a):
        for j in len(b):
            print(a, b)
    ```
- Sum of powers of 2: `2^1 + 2^2 + ... + 2^n = 2^(n+1) - 1`

