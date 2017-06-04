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

(define (e-minus-2 k)
  ; d returns values in the sequence:
  ; k = 1, 2, 3, 4, 5, 6, 7, 8, 9, ...
  ; d = 1, 2, 1, 1, 4, 1, 1, 6, 1, ...
  (define (d k)
    (let ((k-plus-1 (+ k 1)))
      (if (= (remainder k-plus-1 3) 0)
      (* (/ k-plus-1 3.0) 2.0)
      1.0)))
  (cont-frac (lambda (i) 1.0) d k))

(e-minus-2 1000)

