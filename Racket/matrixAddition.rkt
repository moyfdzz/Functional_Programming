#lang racket

(define (row-sum rowA rowB)
  (if (null? rowA)
    '()
    (cons (+ (car rowA) (car rowB)) (row-sum (cdr rowA) (cdr rowB)))
  )
)

(define (matrix-sum matrixA matrixB)
  (if (null? matrixA)
    '()
    (cons (row-sum (car matrixA) (car matrixB)) (matrix-sum (cdr matrixA) (cdr matrixB)))
  )
)

(matrix-sum '((1 2 3) (4 5 6)) '((1 2 3) (4 5 6)))