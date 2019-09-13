#lang racket

;P1 Lambda functions
((lambda (x y) (+ x y)) 5 6)

;P2 Filtering lists
(define (filterSeven lst)
  (filter (lambda (x) (= (remainder x 7) 0)) lst)
)

;(filterSeven '(7 14 15 21))

;P3 Sum of numbers - Recursion
(define (sumRecursion lst)
  (if (null? lst)
    0
    (+ (car lst) (sumRecursion (cdr lst)))
  )
)

;(sumRecursion '(1 2 3 4))

;P4 Sum of numbers - Higher order functions
(define (sumHigh lst)
  (apply + lst)
)

;(sumHigh '(1 2 3 4))

;P5 Graphs
(define (pathExists? graph nodes)
  (not (empty? (filter (lambda (x) (equal? nodes x)) graph)))
)

(pathExists? '((1 2) (1 3) (2 3)) '(1 3))

;P6 Matrix addition
(define (matAdd matrix1 matrix2)
  (if (null? matrix1)
    '()
    (cons (map + (car matrix1) (car matrix2)) (matAdd (cdr matrix1) (cdr matrix2)))
  )
)

;(matAdd '((1 1 1) (3 2 3)) '((5 5 5) (3 2 3)))

;P7 Calculating the balance
(define (calculateBalance tbl)
  (-
    (apply + (map caddr (filter (lambda (x) (string=? (car x) "in")) tbl)))
    (apply + (map caddr (filter (lambda (x) (string=? (car x) "out")) tbl)))
  )
)

;(calculateBalance '(("in" "Salary" 4000) ("in" "Parents" 2000) ("out" "Rent" 3500) ("out" "food" 750) ("out" "hobbies" 400) ("in" "Scholarship" 2500)))