#lang sicp

(define dx 0.00001)

(define (smooth f)
  (lambda (x)
    (/ (+ (f (- x dx))
          (f x)
          (f (+ x dx)))
       3)))

(define (mock-signal x) x)

((smooth mock-signal) 0)  ; 0

(define (compose f g)
  (lambda (x)
    (f (g x))))

(define (repeated f n)
  (define (ident x) x)
  (define (iter n repeated-f)
    (if (= n 0)
      repeated-f
      (iter (- n 1) (compose f repeated-f))))
  (lambda (x) ((iter n ident) x)))

(define (n-fold-smooth f n)
  ((repeated smooth n) f))

((n-fold-smooth mock-signal 2) 0)  ; 0
