#lang sicp

(define (cons a b) (* (expt 2 a) (expt 3 b)))

; return the number of times n can be divided by d
(define (count-divisions n d)
  (define (count-iter current-n total)
    (if (not (= (remainder current-n d) 0))
      total
      (count-iter (/ current-n d) (+ total 1))))
  (count-iter n 0))

(define (car n) (count-divisions n 2))

(define (cdr n) (count-divisions n 3))

(define pair (cons 4 5))
(car pair)  ; 4
(cdr pair)  ; 5
