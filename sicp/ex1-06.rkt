#lang sicp

; The 'if' special form in scheme lazily evaluates the clauses supplied to it.
; If the predicate evaluates to #t, the then-clause is returned, and the 
; else-clause isn't evaluated.
; The new-if function doesn't support this lazy evaluation. Scheme is an
; applicative-ordered language, so all arguments supplied to a function
; are evaluated before being passed to the function.
; In this case, the else-clause is a recursive call, which is always evaluated,
; causing an infinite recursion loop.

