#lang sicp

; f(n) = n if n < 3
; f(n) = f(n-1) + 2f(n-2) + 3f(n-3) if n >= 3
;
; define f(n)
; a. recursively

(define (f n)
  (if (< n 3)
    n
    (+ (f (- n 1))
       (* 2 (f (- n 2)))
       (* 3 (f (- n 3))))))

(f 5)

; b. iteratively
; We can write f(n) in terms of what happens at each step:
; a <- a + 2b + 3c
; b <- a
; c <= b

(define (f2 n)
  (f-iter 2 1 0 (- n 2)))

(define (f-iter a b c count)
  (if (= count 0)
    a
    (f-iter (+ a (* 2 b) (* 3 c)) a b (- count 1))))

(f2 5)

