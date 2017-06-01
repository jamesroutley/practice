#lang sicp

(define (filtered-accumulate filter combiner null-value term a next b)
  (define (iter a remainder)
    (if (> a b)
      remainder
      (if (filter a)
        (iter (next a) (combiner (term a) remainder))
        (iter (next a) remainder))))
  (iter a null-value))

; Write a procedure to find the sum of squares of prime numbers between 
; 'a' and 'b'

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))))

(define (square x)
  (* x x))

(define (divides? divisor n)
  (= (remainder n divisor) 0))

(define (next divisor)
  (if (= 2 divisor)
    3
    (+ divisor 2)))

(define (prime? n)
  (= (smallest-divisor n) n))

(define (sum-of-square-primes a b)
  (define (inc x) (+ x 1))
  (filtered-accumulate prime? + 0 square a inc b))

(sum-of-square-primes 2 6)  ; = 38

; Write a procedure to find the product of all positive integers less than
; n that are relatively prime to n (i.e. GCD(i, n) = 1)

(define (gcd a b)
  (if (= b 0)
    a
    (gcd b (remainder a b))))

(define (relatively-prime? i n)
  (= (gcd i n) 1))

(define (product-of-relative-primes n)
  (define (relatively-prime-to-n? i)
    (relatively-prime? i n))
  (define (ident x) x)
  (define (inc x) (+ x 1))
  (filtered-accumulate relatively-prime-to-n? * 1 ident 1 inc n))

(product-of-relative-primes 12)

