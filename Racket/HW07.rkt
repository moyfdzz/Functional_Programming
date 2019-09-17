#lang racket

;; Complete the following functions and submit your file to Canvas.

;; ========= IMPORTANT ==========
;; Change the name of the file so that it contains your student ID or name.
;; Do not change the names of the functions. The system will specifically look for the names used in this file. Changing the name of a function will automatically make you lose the points for that function.
;; Do not change the number of arguments in the functions. Changing the number of arguments of a function will automatically make you lose the points for that function.
;; Make sure that nothing additional is printed as the result of running this file. Avoid printing names, student IDs, or any other messages. If you print anything else, the system will wrongly grade your solutions.
;; If your file cannot be loaded by the Racket interpreted, your grade will be zero. Then, submit only code that works.

;Moisés Fernández A01197049

;P1 Does the element exist?
(define (exist? x lst)
  (if (null? lst)
		#f
		(if (= (car lst) x)
			#t
			(exist? x (cdr lst))
		)
	)
)

;(exist? 6 '(1 2 3 4 5))

;P2 Getting the index of an element in a list
(define (index x lst)
	(if (null? lst)
		-1
		(if (= (car lst) x)
			0
			(+ 1 (index x (cdr lst)))
		)
	)
)

;(index 10 '(5 10 15 20 25))

;P3 All different
(define (allDifferent? lst)
	(if (null? lst)
		#t
		(if (exist? (car lst) (cdr lst))
			#f
			(allDifferent? (cdr lst))
		)
	)
)

;(allDifferent? '(1 2 3 4 5 66 66))

;P4.1 Set
(define (set x)
	(if (null? x)
		'()
		(if (number? (car x))
			(if (exist? (car x) (cdr x))
				(set (cdr x))
				(cons (car x) (set (cdr x)))
			)
			(set (cdr x))
		)
	)
)

;(set '(1 2 2 2 2 3 2))

;P4.2 Union
(define (union x y)
	(set (append x y))
)

;(union '(1 3 5 7 9) '(2 3 5 7))

;P4.3 Intersection
(define (intersect x y)
  (let ((setX (set x)) 
      	(setY (set y)))
    (if  (null? setX)
      '()
      (if (exist? (car setX) setY)
        (cons (car setX) (intersect (cdr x) (cdr y)))
        (intersect (cdr x) y)
      )
    )
  )
)

;(intersect '(1 3 5 7 9) '(2 3 5 7))

(define (getElementAt mat x y)
  (list-ref (list-ref mat x) y)
)

;P5 Calculating the determinant
(define (det3x3 mat)
	(-
	
	(+(+
 		(((getElementAt mat 0 0)(getElementAt mat 1 1))(getElementAt mat 2 2))
 		(((getElementAt mat 0 1)(getElementAt mat 1 2))(getElementAt mat 2 0)))
 		(((getElementAt mat 0 2)(getElementAt mat 1 0))(getElementAt mat 2 1))
	)

  (+(+
 	(((getElementAt mat 2 0)(getElementAt mat 1 1))(getElementAt mat 0 2))
 	(((getElementAt mat 2 1)(getElementAt mat 1 2))(getElementAt mat 0 0)))
 	(((getElementAt mat 2 2)(getElementAt mat 1 0))(getElementAt mat 0 1)))

  )
)

(det3x3 '((2 1 3) (4 1 2) (3 9 3)))