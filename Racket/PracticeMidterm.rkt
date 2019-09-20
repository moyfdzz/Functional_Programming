#lang racket

(define (enigmaA x)
  (if (null? x)
    '()
    (cons (caar x) (list (enigmaA (cdr x))))
  )
)

(enigmaA '((1 2) (3 4) (5 6)))

(define (enigmaB x y)
  (x y)
)

;(enigmaB (lambda (x) cons (x x)) '(a b))

(define (maskedSum lstN lstB)
  (if (null? lstN)
    0
    (if (car lstB)
      (+ (car lstN) (maskedSum (cdr lstN) (cdr lstB)))
      (maskedSum (cdr lstN) (cdr lstB))
    )
  )
)

(maskedSum '(1 2 3 4 5 6) '(#t #f #f #t #f #t))

(define (row-sum lst)
  (apply + lst)
)

(define (sumMatrix mat)
  (if (null? mat)
    0
    (apply + (map row-sum mat))  
  )
)

(sumMatrix '((1 2 3) (4 5 6) (7 8 9)))