#lang sicp
; Import 'random' procedure
(#%require (only racket/base random))

; Miller-Rabin test - if 'n' is a prime number, and 'a' is any positive
; integer less than 'n', 'a^(n-1)' is congruent to 1 modulo 'n'

(define (square x)
  (* x x))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp) (remainder (square (expmod base (/ exp 2) m))
                                m))
        (else (remainder (* base (expmod base (- exp 1) m))
                          m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

(fast-prime? 11 4)

