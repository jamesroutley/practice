#lang sicp

(define (square x) (* x x))

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

((repeated square 2) 5)
