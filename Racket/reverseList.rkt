#lang racket

(define (myReverse x)
	(if (null? x)
		x
		(append (myReverse (cdr x)) (list (car x)))
	)
)

(myReverse '(a b c))