#lang sicp

; The original expmod performs better than a version which calculates the 
; exponential before finding the modulo because it performs a modulo operation
; at each intermediate stage. This means that all arithmetic is performed on
; numbers smaller than 'm'. Arithmetic on smaller numbers is faster than on
; larger numbers, and without taking modulo frequently, numbers can grow to be
; large (they grow exponentially).

