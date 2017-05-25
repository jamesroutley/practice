#lang sicp

(define (cbrt x)
  (cbrt-iter 0.9 1.0 x))

(define (cbrt-iter prev-guess guess x)
  (if (good-enough? prev-guess guess)
    guess
    (cbrt-iter guess (improve guess x) x)))

(define (good-enough? prev-guess guess)
  (if (< prev-guess guess)
    (> (/ prev-guess guess) 0.99)
    (> (/ guess prev-guess) 0.99)))

(define (improve guess x)
  (/ (+ (/ x 
           (* guess guess)) 
        (* 2 guess)) 
     3))

(cbrt 8)

