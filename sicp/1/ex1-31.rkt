#lang sicp

; Define a procedure 'product', which returns the product of a given function
; at points over a given range.

(define (product term a next b)
  (if (> a b)
    1
    (* (term a)
       (product term (next a) next b))))

(define (factorial n)
  (define (identity a) a)
  (define (next a) (+ a 1))
  (product identity 1 next n))

(factorial 6)  ; = 720


; Define an iterative 'product' procedure:

(define (product-iter term a next b)
  (define (iter a result)
    (if (> a b)
      result
      (iter (next a) (* (term a) result))))
  (iter a 1))

(define (factorial-iter n)
  (define (identity a) a)
  (define (next a) (+ a 1))
  (product-iter identity 1 next n))

(factorial-iter 6)  ; = 720


