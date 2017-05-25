#lang sicp

(define (p) (p))

(define (test x y)
  (if (= x 0)
    0
    y))

(test 0 (p))

; Applicative-order evaluation (evaluate operator and operands, apply 
; resulting procedure to resulting arguments)
;
; (test 0 (p))
; 
; Evaluate (p) - Infinite recursion loop

; Normal-order evaluation (fully expand then reduce)
;
; (test 0 (p))
;
; Expand 'test' function
; (if (= 0 0)
;   0
;   (p))
;
; Evaluate (= 0 0)
; (if #t
;   0
;   (p))
;
; 0
