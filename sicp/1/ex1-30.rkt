#lang sicp

; Write an iterative version of 'sum':

(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
      result
      (iter (next a) (+ (term a) result))))
  (iter a 0))

; We test it by implementing and running sum-cubes:

(define (sum-cubes a b)
  (define (inc x) (+ x 1))
  (define (cube x) (* x x x))
  (sum cube a inc b))

(sum-cubes 1 10)  ; = 3025

