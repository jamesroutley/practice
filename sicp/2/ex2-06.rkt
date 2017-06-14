#lang sicp

(define zero (lambda (f) (lambda (x) x)))

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

; Calculate the value of one:
; (add-1 zero)
; (lambda (f) (lambda(x) (f ((zero f) x))))
; (lambda (f) (lambda(x) (f ((lambda (x) x) x))))
; (lambda (f) (lambda(x) (f x)))

(define one (lambda (f) (lambda(x) (f x))))

; Calculate the value of two:
; (add-1 one)
; (lambda (f) (lambda (x) (f ((one f) x))))
; (lambda (f) (lambda (x) (f ((lambda(x) (f x)) x))))
; (lambda (f) (lambda (x) (f (f x))))

(define two (lambda (f) (lambda (x) (f (f x)))))

; Church numerals take the form: (lambda (f) (lambda (x) (f^n x)))
; They represent a number n by returning a function which calls f n times 

; Define an add function:
(define (add a b)
  (lambda (f) (lambda (x) ((a f) ((b f) x)))))
