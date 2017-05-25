#lang sicp

(define (sqrt x)
  (sqrt-iter 1.0 x))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
    guess
    (sqrt-iter (improve guess x) x)))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (square x)
  (* x x))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))


; If 'x' is small (>> 0), then a difference between the square of the guess
; and x of 0.001 may be a large difference between the guessed square root
; and the actual value.
;
; e.g. Output of:

(sqrt 0.0001)

; is 0.03230 but it should be 0.01.

; 0.03230 ^ 2 = 0.00104, so the difference between
; the guess squared and x is 0.00094.
; 0.00094 < 0.001, so good-enough? returns #t, despite the actual accuracy
; being low.


; If 'x' is large, then the difference between guess ^ 2 and x cannot be
; accurately calculated. This can lead to good-enough? giving false positives
; or false negatives


(define (sqrt-improved x)
  (sqrt-iter-improved 1.0 0.9 x))

(define (sqrt-iter-improved guess prev-guess x)
  (if (good-enough-improved? guess prev-guess)
    guess
    (sqrt-iter-improved (improve guess x) guess x)))

(define (good-enough-improved? guess prev-guess)
  (if (< guess prev-guess)
    (> (/ guess prev-guess) 0.99)
    (> (/ prev-guess guess) 0.99)))

(sqrt-improved 0.0001)

