#lang sicp

(define (gcd a b)
  (if (= b 0)
    a
    (gcd b (remainder a b))))

(gcd 16 28)

; Apply the substitution method to (gcd 206 40). Assume normal-order 
; evaluation
;
; (gcd 206 40):
; (if (= 40 0)
;   206
;   (gcd 40 (remainder 206 40)))
;
; (gcd 40 (remainder 206 40))):
; (if (= (remainder 206 40) 0)  ; 1 remainder calc performed
;   40
;   (gcd (remainder 206 40) (remainder 40 (remainder 206 40))))
;
; (gcd (remainder 206 40) (remainder 40 (remainder 206 40)))):
; (if (= (remainder 40 (remainder 206 40)) 0)  ; < 2 remainder calcs
;   (remainder 206 40)
;   (gcd (remainder 40 (remainder 206 40))
;        (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))
;
; (gcd (remainder 40 (remainder 206 40))
;      (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))):
;         2          6                  4             6
; (if (= (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) 0)  ; 4 calcs
;   (remainder 40 (remainder 206 40)) 
;   (gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
;        (remainder (remainder 40 (remainder 206 40))
;                   (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))
;
; (gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
;      (remainder (remainder 40 (remainder 206 40))
;                 (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))):
; (if (= (remainder (remainder 40 (remainder 206 40))
;                   (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))  ; 7 calcs
;   (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))  ; 4 calcs
;
; (2)
;
; 18 remainder calculations performed

; Apply substitiution method to (gcd 206 40). Assume applicative order
; evaluation
;
; (gcd 206 40):
; (if (= 40 0)
;   206
;   (gcd 40 (remainder 206 40)))  ; 1 calculation
;
; (gcd 40 6):
; (if (= 6 0)
;   40
;   (gcd 6 (remainder 40 6)))  ; 1 calc
;
; (gcd 6 4):
; (if (= 4 0)
;   6
;   (gcd 4 (remainder 6 4)))  ; 1 calc
;
; (gcd 4 2):
; (if (= 2 0)
;   4
;   (gcd 2 (remainder 4 2)))  ; 1 calc

; (gcd 2 0):
; (if (= 0 0)
;   2)
;
; 4 remainder calculations performed

