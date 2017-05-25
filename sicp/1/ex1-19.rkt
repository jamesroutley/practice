#lang sicp

; To find p' and q', write the equations for a0 and b0. Write equations for
; a1 and b1, substitute in values of a0 and b0, rearrange equation into the
; form:
; a = bq' + aq' + ap'
; b = bp' + aq'

(define (fib n)
  (fib-iter 1 0 0 1 n))

(define (fib-iter a b p q count)
  (cond ((= count 0) b)
        ((even? count) (fib-iter a 
                                 b 
                                 (+ (square p) (square q))
                                 (+ (* 2 p q) (square q))
                                 (/ count 2)))
        (else (fib-iter (+ (* b q) (* a q) (* a p))
                        (+ (* b p) (* a q))
                        p
                        q
                        (- count 1)))))

(define (square x)
  (* x x))

(fib 0)
(fib 1)
(fib 2)
(fib 3)
(fib 4)
(fib 5)
(fib 6)
(fib 7)

