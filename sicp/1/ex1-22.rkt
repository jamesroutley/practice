#lang sicp

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (square x)
  (* x x))

(define (divides? divisor n)
  (= (remainder n divisor) 0))

(define (prime? n)
  (= (smallest-divisor n) n))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
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

(search-for-primes 1000 1020)
; Three smallest primes after 1000 are:
; - 1009: 1ms
; - 1013: 1ms
; - 1019: 1ms

(search-for-primes 10000 10040)
; Three smallest primes after 10000 are:
; - 10007: 3ms
; - 10009: 3ms
; - 10037: 3ms

(search-for-primes 100000 100050)
; Three smallest primes after 100000 are:
; - 100003: 7ms
; - 100019: 7ms
; - 100043: 7ms

(search-for-primes 1000000 1000040)
; Three smallest primes after 100000 are:
; - 1000003: 20ms
; - 1000033: 20ms
; - 1000037: 18ms


; Time complexity for our prime search is sqrt(n). Multiplying n by 10 should
; increase time by sqrt(10) = 3.2. This is roughly shown in the increasing 
; time taken to calculate whether a number is prime.

