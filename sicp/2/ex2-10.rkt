#lang sicp

(define (div-interval x y)
  (if (and (<= (lower-bound y) 0) (>= (upper-bound y) 0))
    (display "error, cannot divide by zero")
    (mul-interval x (make-interval (/ 1.0 (upper-bound y)) (/ (lower-bound y))))))
