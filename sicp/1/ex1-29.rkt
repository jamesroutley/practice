#lang sicp

; Implement Simpson's Rule for calculating the integral of a function f
; between a and b:
; 
; h/3(y0 + 4y1 + 2y2 + 4y3 + ... + 2yn-2 + 4yn-1 + yn)
; where h = (b-a)/n for some even integer n, 
; and yk = f(a + kh)

; sum returns the sum of a sequence
; term: function applied to each item in the sequence
; k: start of the sequence
; next: callable which returns the next value of 'k'
; n: end of the sequence
(define (sum term k next n)
  (if (> k n)
    0
    (+ (term k) (sum term (next k) next n))))

; integral-h returns the term 'h', given 'a' and 'b'
; a: start of integration
; b: end of integration
(define (integral-h a b n) (/ (- b a) n))

; inc returns 'k' + 1
; k: number to increment
(define (inc k) (+ k 1))

; integral returns the integral of function 'f' over the range 'a' to 'b'
; f: the function to integrate
; a: start of integration
; b: end of integration
(define (integral f a b n)
  ; coef returns the coefficient that yk should be multiplied by
  ; k: the iteration number
  (define (coef k)
    (cond ((= k 0) 1)
          ((= k n) 1)
          ((even? k) 2)
          (else 4)))
  ; term returns the value of yk, for a given 'k'
  ; k: number associated with the iteration, where k is an int 0 < k < n
  (define (term k)
    (* (coef k)
       (f (+ a (* k (integral-h a b n))))))
  (* (/ (integral-h a b n) 3)
     (sum term 0 inc n)))

(define (cube x)
  (* x x x))

(integral cube 0 1 100)  ;  = 1/4
(integral cube 0 1 1000)  ;  = 1/4

