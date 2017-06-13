#lang sicp


(define (average-damp f)
  (define (average x y)
    (/ (+ x y) 2))
  (lambda (x) (average x (f x))))


(define (repeated f n)
  (define (compose f g)
    (lambda (x) (f (g x))))
  (define (ident x) x)
  (define (iter n repeated-f)
    (if (= n 0)
      repeated-f
      (iter (- n 1) (compose f repeated-f))))
  (lambda (x) ((iter n ident) x)))

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
        next
        (try next))))
  (try first-guess))

; Investigate the number of repeated average-damp functions are needed to find
; the nth root

; n  #average-damp
; 2  1
; ...
; 4  2
; ...
; 8  3
; ...
; 16 4

; We need log base 2(n) repeated average-damp

(define (nthrt x n)
  (define (log2 x)
    (/ (log x) (log 2)))
  (let ((num-ave-damp (floor (log2 n))))
    (fixed-point ((repeated average-damp num-ave-damp) 
                  (lambda (y) (/ x (expt y (- n 1))))) 
                 1.0)))

(nthrt 32 50)  ; works
