#lang sicp

(define (multiply a b)
  (multiply-iter a b 0))

(define (multiply-iter a b c)
  (cond ((= b 0) c)
        ((even? b) (multiply-iter (double a) (halve b) c))
        (else (multiply-iter a (- b 1) (+ a c)))))

(define (double x)
  (+ x x))

(define (halve x)
  (/ x 2))

(define (even? x)
  (= (remainder x 2) 0))

(multiply 2 4)
