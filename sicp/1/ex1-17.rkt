#lang sicp

; Naive multiplication - O(n) time
(define (multiply a b)
  (if (= b 0)
    0
    (+ a (multiply a (- b 1)))))

; Fast multiplication - O(log n) time
; Makes use of the identities:
; a * b = 2*(a * b/2)  if b is even
;       = a + a(b - 1) if b is odd
(define (double x)
  (+ x x))

(define (halve x)
  (/ x 2))

(define (even? x)
  (= (remainder x 2) 0))

(define (fast-multiply a b)
  (cond ((= b 0) 0)
        (else (if (even? b)
                (double (fast-multiply a (halve b)))
                (+ a (fast-multiply a (- b 1)))))))

(fast-multiply 0 6)

