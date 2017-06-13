#lang sicp

(define (make-point x y) (cons x y))

(define (x-point p) (car p))

(define (y-point p) (cdr p))

(define (make-segment s e) (cons s e))

(define (start-segment seg) (car seg))

(define (end-segment seg) (cdr seg))

(define (midpoint-segment seg)
  (define (average x y) (/ (+ x y) 2))
  (let ((startx (x-point (start-segment seg)))
        (starty (y-point (start-segment seg)))
        (endx (x-point (end-segment seg)))
        (endy (y-point (end-segment seg))))
    (make-point (average startx endx) (average starty endy))))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define test-seg (make-segment (make-point 0 0) (make-point 1 1))) 
(print-point (midpoint-segment test-seg))  ; = (1/2, 1/2)
