#lang sicp
; Import 'random' procedure
(#%require (only racket/base random))

(define (square x)
  (* x x))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

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

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (fast-prime? n 15)
    (report-prime (- (runtime) start-time))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (search-for-primes start stop)
  (cond ((< start stop) (timed-prime-test start)
                        (search-for-primes (next-odd start) stop))))

(define (next-odd n)
  (if (divides? 2 n)
    (+ n 1)
    (+ n 2)))

(define (divides? divisor n)
  (= (remainder n divisor) 0))

(search-for-primes 1000 1020)
; Three smallest primes after 1000 are:
; - 1009: 154ms (!)
; - 1013: 10ms
; - 1019: 10ms

(search-for-primes 10000 10040)
; Three smallest primes after 10000 are:
; - 10007: 12ms
; - 10009: 12ms
; - 10037: 12ms

(search-for-primes 100000 100050)
; Three smallest primes after 100000 are:
; - 100003: 14ms
; - 100019: 14ms
; - 100043: 14ms

(search-for-primes 1000000 1000040)
; Three smallest primes after 100000 are:
; - 1000003: 15ms
; - 1000033: 15ms
; - 1000037: 16ms

; Time complexity for our prime search is log(n). Multiplying n by 10 results
; in a constant time increase.

