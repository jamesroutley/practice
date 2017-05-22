#lang sicp

; func returns a + abs(b). Equivalent to:
; a + b if b > 0
; a - b if b <= 0
; Ifi expression checks the sign of b and returns the correct + or - operator.
(define (a-plus-abs-b a b)
  ((if > b 0) + -) a b)
