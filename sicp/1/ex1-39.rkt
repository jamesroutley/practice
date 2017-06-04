#lang sicp

(define (cont-frac n d k)
  (define (cont-frac-iter i)
    (let ((nk (n k))
          (dk (d k)))
      (if (>= i k)
        (/ nk dk)
        (/ nk (+ dk (cont-frac-iter (+ i 1)))))))
  (cont-frac-iter 1))

(define (tan x)
  (define (odd-nums i)
    (- (* i 2) 1))
  (define (mostly-squared i)
    (if (= i 1)
      x
      (* x x)))
  (cont-frac mostly-squared odd-nums 50))

(tan 0)  ; = 0

