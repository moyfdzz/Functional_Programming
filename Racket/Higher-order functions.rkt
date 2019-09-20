#lang racket

;;; Functions as arguments
;;; ===================================
(define (myApply function a b)
  (function a b)
)

(display " == Functions as arguments ==\n")
(myApply + 8 5)
(myApply * 8 5)
(myApply remainder 8 5)

;;; Applying a function to each element in a list: map
;;; ===================================
(map sqrt '(4 9 16 25 36))
(map + '(1 2 3) '(4 5 6))
(map list '(1 2 3) '(4 5 6))

(define (transpose matrix)
  (cond
    ((null? (car matrix)) null)
    (else (cons (map car matrix) (transpose (map cdr matrix))))
    )
)

(display " == Transpose of a matrix (map example) ==\n")
(transpose '((10 4 8) (4 7 10)))

;;; Applying a function to each element in a list: for-each
;;; ===================================
(display " == Applying functions to the elements in a list (for-each example) ==\n")
(for-each display '("hello" " " "world" "\n"))

;;; Applying a function to each element in a list: apply
;;; ===================================
(display " == Applying functions to the elements in a list (apply example) ==\n")
(apply + '(4 10 17 3))
(apply + 4 10 '(17 3))

;;; Functions that return functions
;;; ===================================
(define (get-function option)
  (cond
    ((= option 1) +)
    ((= option 2) -)
    ((= option 3) *)
    ((= option 4) /)
    )
)

(display " == Functions that return functions ==\n")
((get-function 1) 10 3)
((get-function 2) 10 3)
((get-function 3) 10 3)
((get-function 4) 10 3)

;;; Lists of functions
;;; ===================================

(define functions (list + - * /))

(display " == Lists of functions ==\n")
((car functions) 10 3)
((cadr functions) 10 3)
((caddr functions) 10 3)
((cadddr functions) 10 3)

;;; The benefit of using higher-order functions: many functions based on one
;;; ===================================

(define (fold op base x)
  (if (null? x)
      base
      (op (car x) (fold op base (cdr x)))
  )
)

(display " == Function templeates by using higher-order functions ==\n")
(define (sum x) (fold + 0 x))
(define (mul x) (fold * 1 x))
(define (concat x y) (fold cons x y))

;;; Currying
;;; ===================================

(display " == Currying ==\n")
((lambda (x y) (+ x y)) 5 6)
(((lambda (x) (lambda (y) (+ x y))) 5) 6)

;;; Create a function that applies a function twice
;;; ===================================
(define apply-twice
  (lambda (function)
    (lambda (value)
      (function (function value))
    )
  )
)

(display " == A functions that is invoked twice (currying example) ==\n")
(define remove-twice (apply-twice cdr))
(remove-twice '(a b c d e f))