

\ Implement builtins

: MYNIP ( a b -- b  ) SWAP DROP ;

: MYTUCK ( a b -- b a b ) SWAP OVER ;

: MY2DUP ( a b -- a b a b ) OVER OVER ;

\ Implement common algorithms

: SQRT ( square -- root ) 0 TUCK DO 1+ DUP 2* 1+ +LOOP ;

: FACTORIAL ( n -- n! ) 1 SWAP 1+ 1 DO I * LOOP ;

: ISFACTOR ( a b -- a%b == 0 ) MOD 0 = ;

: FIZZBUZZ ( n -- ) 1+ 1 DO CR I 15 ISFACTOR IF ." FIZZBUZZ" ELSE I 5 ISFACTOR IF ." BUZZ" ELSE I 3 ISFACTOR IF ." FIZZ" ELSE I . THEN THEN THEN LOOP ;

: NSUM ( n -- n! ) 0 SWAP 1+ 1 DO I + LOOP ;
