#lang sicp
; Import 'random' procedure
(#%require (only racket/base random))

; 561, 1105, 1729, 2465, 2821, and 6601 are Carmichael numbers. They pass the
; Fermat's little theorem test, but are not in fact prime. To demonstrate this
; we run the fermat test with each int a < Carmichael number.

(define (square x)
  (* x x))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp) (remainder (square (expmod base (/ exp 2) m))
                                m))
        (else (remainder (* base (expmod base (- exp 1) m))
                          m))))

(define (fermat-test n a)
  (= (expmod a n n) a))

(define (carmichael-test c)
  (define (carmichael-test-iter c a)
    (cond ((>= a c) (display "test passed") (newline))
          ((fermat-test c a) (carmichael-test-iter c (+ a 1)))
          (else (display "test failed") (newline))))
  (display "testing: ")
  (display c)
  (display " *** ")
  (carmichael-test-iter c 0))

(carmichael-test 561)
(carmichael-test 1105)
(carmichael-test 1729)
(carmichael-test 2821)
(carmichael-test 6601)

