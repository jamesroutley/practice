 #lang sicp

(define (double f)
  (lambda (arg)
    (f (f arg))))

(define (inc x) (+ x 1))

((double inc) 2)  ; = 4

; Adds 16:
(((double (lambda (arg0) (double (double arg0)))) inc) 5)  ; 21
; (((lambda (arg2) 
;     ((lambda (arg1) (double (double arg1))) 
;      ((lambda (arg0) (double (double arg0)) arg2)))) inc) 5)
; (((lambda (arg1) (double (double arg1))) 
;     ((lambda (arg0) (double (double arg0)) inc))) 5)
; (((lambda (arg1) (double (double arg1))) (double (inc))) 5)
; ((double (double (double (double inc)))) 5)
