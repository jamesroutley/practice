#lang sicp

(define (cube x) (* x x x))

(define (p x)
  (display x)
  (newline)
  (- (* 3 x) (* 4 (cube x))))

(define (sine angle)
  (if (< (abs angle) 0.1)
    angle
    (p (sine (/ angle 3.0)))))

(sine 12.15)

; 1. For (sine 12.15), procedure p is invoked 5 times.
; (sine 12.15)
; (p (sine 4.05))
; (p (p (sine 1.35)))
; (p (p (p (sine 0.45))))
; (p (p (p (p (sine 0.15)))))
; (p (p (p (p (p (sine 0.03))))))
; (p (p (p (p (p 0.03)))))
;
; 2. Space and time complexity are described as O(log n). You can triple the
; size of the input, and only have to perform one extra calculation.

