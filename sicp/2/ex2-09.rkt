#lang sicp

(define (make-interval a b) (cons a b))

(define (lower-bound i) (car i))
(define (upper-bound i) (cdr i))

(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))

(define (sub-interval x y)
  (make-interval (- (lower-bound x) (upper-bound y))
                 (- (upper-bound x) (lower-bound y))))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4) (max p1 p2 p3 p4))))

(define (div-interval x y)
  (mul-interval x (make-interval (/ 1.0 (upper-bound y)) (/ (lower-bound y)))))

(define (width i)
  (/ (- (upper-bound i) (lower-bound i)) 2))

(define x (make-interval 9 11))
(define y (make-interval 14 18))
(sub-interval x y)  ; lower bound: -2, upper bound: 2, as expected

(width x)  ; = 1
(width y)  ; = 2
(width (add-interval x y))  ; = 3, width x + width y
(width (sub-interval x y))  ; = 3, width x + width y
(width (mul-interval x y))  ; = 36
(width (div-interval x y))  ; = 0.142
