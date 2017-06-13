#lang sicp

; Return the k-term finite continued fraction.
; n: callable that returns the value of Nk
; d: callable that returns the value of Dk
; k: iteration number
(define (cont-frac n d k)
  (define (cont-frac-iter i)
    (let ((ni (n i))
          (di (d i)))
      (if (>= i k)
        (/ ni di)
        (/ ni (+ di (cont-frac-iter (+ i 1)))))))
  (cont-frac-iter 1))

; To define cont-frac iteratively, we must sum up from k -> 0.

(define (cont-frac-iterable n d k)
  (define (cont-frac-iter i total)
    (let ((ni (n i))
          (di (d i)))
      (if (= i 0)
        total
        (cont-frac-iter (- i 1) (/ ni (di + total))))))
  (cont-frac-iter k 0))

(define (one-over-phi k) (cont-frac-iterable (lambda (i) 1.0) (lambda (i) 1.0) k))

(one-over-phi 11)

; Work out the value of k which gives 1/phi to 4dp of accuracy.
; 1/phi = 0.6180

; Given by (one-over-phi 11)

