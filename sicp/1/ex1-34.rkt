#lang sicp

(define (f g) (g 2))

; What happens when we try to evaluate (f f)?
(f f)
; (f 2)
; (2 2)
; error: 2 isn't a procedure

