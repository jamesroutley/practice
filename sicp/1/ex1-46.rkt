#lang sicp

(define (iterative-improve good-enough improve)
  (define (improve-guess guess)
    (if (good-enough guess)
      guess
      (improve-guess (improve guess)))) 
  (lambda (guess) (improve-guess guess)))

; Define sqrt in terms of iterative-improve

(define (sqrt x)
  (define (square x) (* x x))
  (define (good-enough guess)
    (< (abs (- (square guess) x)) 0.001))
  (define (average x y) (/ (+ x y) 2))
  (define (improve guess)
    (average guess (/ x guess)))
  ((iterative-improve good-enough improve) 1.0))

(sqrt 4)

; Define fixed-point in terms of iterative-improve

(define (fixed-point f first-guess)
  (define (good-enough guess)
    (< (abs (- guess (f guess))) 0.00001))
  (define (improve guess) (f guess))
  ((iterative-improve good-enough improve) first-guess))

(fixed-point cos 1.0)
