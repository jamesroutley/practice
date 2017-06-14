#lang sicp

(define (make-interval a b) (cons a b))

(define (lower-bound i) (car i))
(define (upper-bound i) (cdr i))

; When subtracting intervals, x - y, the largest possible value is xmax - ymin.
; The smallest is xmin - ymax

(define (sub-interval x y)
  (make-interval (- (lower-bound x) (upper-bound y))
                 (- (upper-bound x) (lower-bound y))))

(define x (make-interval 9 11))
(define y (make-interval 9 11))
(sub-interval x y)  ; lower bound: -2, upper bound: 2, as expected
