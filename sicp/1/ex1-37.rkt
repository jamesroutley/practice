#lang sicp

; Return the k-term finite continued fraction.
; n: callable that returns the value of Nk
; d: callable that returns the value of Dk
; k: iteration number
(define (cont-frac n d k)
  (define (cont-frac-iter i)
    (let ((nk (n k))
          (dk (d k)))
      (if (>= i k)
        (/ nk dk)
        (/ nk (+ dk (cont-frac-iter (+ i 1)))))))
  (cont-frac-iter 1))

(define (one-over-phi k) (cont-frac (lambda (i) 1.0) (lambda (i) 1.0) k))

(one-over-phi 5)

; Work out the value of k which gives 1/phi to 4dp of accuracy.

