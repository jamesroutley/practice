#lang sicp

(define (cons x y)
  (lambda (m) (m x y)))

(define (car z)
  (z (lambda (p q) p)))

(define (cdr z)
  (z (lambda (p q) q)))

(define a (cons 1 2))
(car a)
(cdr a)

; (cdr a)
; (cdr (cons 1 2))
; (cdr (lambda (m) (m 1 2)))
; ((lambda (m) (m 1 2)) (lambda (p q) q))
; ((lambda (p q) q) 1 2)
; 2
