#lang sicp

(define (sum-of-largest-squares x y z)
  (cond ((and (<= x y) (<= x z)) (sum-of-squares y z))
        ((and (<= y x) (<= y z)) (sum-of-squares x z))
        (else (sum-of-squares x z))))

(define (sum-of-squares x y)
  (+ (square x) (square y)))

(define (square x)
  (* x x))


; (sum-of-largest-squares 1 2 3)