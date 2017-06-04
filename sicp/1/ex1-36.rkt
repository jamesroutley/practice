#lang sicp

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess count)
    (display "guess ")
    (display count)
    (display ": ")
    (display guess)
    (newline)
    (let ((next (f guess)))
      (if (close-enough? guess next)
        next
        (try next (+ count 1)))))
  (try first-guess 0))

; Find a solution to x^x = 1000 by finding the fixed point in:
; x -> log(1000)/log(x)
(fixed-point (lambda (x) (/ (log 1000) (log x))) 1.5)
; This takes 36 iterations to find a solution.

; Add average damping:
; x -> 1/2(x + log(1000)/log(x))
(fixed-point (lambda (x) (* (/ 1 2)
                            (+ x (/ (log 1000) (log x))))) 
             1.5)
; This takes 11 iterations.


