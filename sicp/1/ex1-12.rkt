#lang sicp

; Function pascal returns the value of the element in Pascal's Triange at
; position (x, y).
;
;      x=0
; y=0  1
;      1 1
;      1 2 1
;      1 3 3 1


(define (pascal x y)
  (cond 
        ((> y x) 0)
        ((< x 0) 0)
        ((< y 0) 0)
        ((= x 0) 1)
        ((= y 0) 1)
        (else (+ (pascal (- x 1) (- y 1)) 
                 (pascal (- x 1) y)))))

(pascal 3 1)

