#lang sicp

; Scheme is a applicative-ordered language, so performing:
; (square (expmod base (/ n 2) m))

; Calculates expmod once, but:
; (* (expmod base (/ n 2) m) (expmod base (/ n 2) m))

; calculates it twice. When calculating it once, multiplying exp by two only
; adds one expmod call, making it O(log n). When it is called twice, each
; call makes two further calls, making the number of calls grow exponentially.
; Complexity is O(log 2^n) = O(n).
