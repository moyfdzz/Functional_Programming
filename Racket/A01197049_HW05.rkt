#lang racket

;; Complete the following functions and submit your file to Canvas.

;; ========= IMPORTANT ==========
;; Change the name of the file so that it contains your student ID or name.
;; Do not change the names of the functions. The system will specifically look for the names used in this file. Changing the name of a function will automatically make you lose the points for that function.
;; Do not change the number of arguments in the functions. Changing the number of arguments of a function will automatically make you lose the points for that function.
;; Make sure that nothing additional is printed as the result of running this file. Avoid printing names, student IDs, or any other messages. If you print anything else, the system will wrongly grade your solutions.
;; If your file cannot be loaded by the Racket interpreted, your grade will be zero. Then, submit only code that works.

;;Moisés Fernández Zárate A01197049

;;P1 Reversing a list
(define (myReverse x)
	(if (null? x)
		'()
		(append (myReverse (cdr x)) (cons (car x) '()))
	)
)

;;P5 Calculating the mean
(define (sumList l)
  (if (null? l)
    0
		(+ (car l) (sumList (cdr l)))
  )
)

(define (myMean x)
	(if (null? x)
		"Error."
		(/ (sumList x) (length x))
	)
)

;;P6 Fibonacci numbers
(define (fibonacci n)
	(if (or (= n 0) (= n 1))
		n
		(+ (fibonacci (- n 1)) (fibonacci (- n 2)))
	)		
)

;;P2 Sum
(define (sum x)
	(if (null? x)
		0
		(if (list? (car x))
			(sum (cdr x))
			(+ (car x) (sum (cdr x)))
		)
	)	
)

;;P3 Nested sum
(define (nestedSum x)
	(if (null? x)
		0
		(if (list? (car x))
			(+ (nestedSum (car x)) (nestedSum (cdr x)))
			(+ (car x) (nestedSum (cdr x)))
		)
	)	
)

;;P4 Removing nested lists
(define (removeNestedLists x)
	(if (null? x)
		'()
		(if (list? (car x))
			(append (removeNestedLists (car x)) (removeNestedLists (cdr x)))
			(cons (car x) (removeNestedLists (cdr x)))
		)
	)		
)