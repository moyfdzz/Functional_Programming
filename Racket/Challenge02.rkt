#lang racket

;;P1 Prime numbers
(define (primeAux x n)
  (cond
    ((>= n x) #t)
    ((= (remainder x n) 0) #f)
    (else (primeAux x (+ n 1)))
  )
)

(define (prime? x)
  (primeAux x 2)
)

(prime? 4)

;;P2 Counting digits
(define (countDigitsAux x)
  (if (> (quotient x 10) 1)
    (+ 1 (countDigitsAux (/ x 10)))
    
  )
)

(define (countDigits l)
  (if (null? l)
    0
    (+ (countDigitsAux (car l)) (countDigits (cdr l)))
  )
)