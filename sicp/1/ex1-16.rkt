#lang sicp

; a is a state variable, defined such that a*b^n remains unchanged from state
; to state.

(define (fast-exp-iter b n a)
  (cond ((= n 0) a)
        ((even? n) (fast-exp-iter (square b) (/ n 2) a))
        (else (fast-exp-iter b (- n 1) (* a b)))))

(define (even? x)
  (= (remainder x 2) 0))

(define (square x)
  (* x x))

(define (fast-exp b n)
  (fast-exp-iter b n 1))

(fast-exp 2 10)

; (fast-exp 2 3)
; (fast-exp-iter 2 3 1)
; (fast-exp-iter 2 2 2)
; (fast-exp-iter 4 1 2)
; (fast-exp-iter 4 0 8)
; 8

