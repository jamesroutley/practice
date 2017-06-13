#lang sicp

(define (make-point x y) (cons x y))

(define (x-point p) (car p))

(define (y-point p) (cdr p))

(define (make-segment s e) (cons s e))

(define (start-segment seg) (car seg))

(define (end-segment seg) (cdr seg))

(define (length-segment seg)
  (define (square x) (* x x))
  (let ((sx (x-point (start-segment seg)))
        (sy (y-point (start-segment seg)))
        (ex (x-point (end-segment seg)))
        (ey (y-point (end-segment seg))))
    (sqrt (+ (square (- sx ex)) (square (- sy ey))))))

; Define procedures for calculating the area and perimeter of some rectangle
; r. Procedures are defined in terms of the procedures height-rect and 
; width-rect, and do not depend on the underlying representation of a rectangle
(define (area-rect r)
  (* (height-rect r) (width-rect r)))

(define (perimeter-rect r)
  (* 2 (+ (height-rect r) (width-rect r))))

; To demonstrate this lack of dependency, we can define rectangle in two ways,
; each compatible with area-rect and perimeter-rect
; 1) Rectangle defined by two points, at opposite sides
(define (make-rect-1 a b) (cons a b))

(define (height-rect-1 r) 
  (let ((xa (x-point (car r)))
        (xb (x-point (cdr r))))
    (abs (- xa xb))))

(define (width-rect-1 r) 
  (let ((ya (y-point (car r)))
        (yb (y-point (cdr r))))
    (abs (- ya yb))))

; 2) Rectangle defined by two perpindicular segments
(define (make-rect-2 a b) (cons a b))

(define (height-rect-2 r) (length-segment (car r)))

(define (width-rect-2 r) (length-segment (cdr r)))

; Test 1)
(define height-rect height-rect-1)
(define width-rect width-rect-1)

(define rect-1 (make-rect-1 (make-point 0 0) (make-point 1 1)))
(area-rect rect-1)
(perimeter-rect rect-1)

; Test 2)
; (define height-rect height-rect-2)
; (define width-rect width-rect-2)

; (define rect-2 (make-rect-2 (make-segment (make-point 0 0) (make-point 1 0))
;                             (make-segment (make-point 0 0) (make-point 0 1))))
; (area-rect rect-2)
; (perimeter-rect rect-2)


