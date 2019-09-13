#lang racket

;; Complete the following functions and submit your file to Canvas.

;; ========= IMPORTANT ==========
;; Change the name of the file so that it contains your student ID or name.
;; Do not change the names of the functions. The system will specifically look for the names used in this file. Changing the name of a function will automatically make you lose the points for that function.
;; Do not change the number of arguments in the functions. Changing the number of arguments of a function will automatically make you lose the points for that function.
;; Make sure that nothing additional is printed as the result of running this file. Avoid printing names, student IDs, or any other messages. If you print anything else, the system will wrongly grade your solutions.
;; If your file cannot be loaded by the Racket interpreted, your grade will be zero. Then, submit only code that works.

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
	(display "Not yet implemented.")
)

(define (set x)
	(display "Not yet implemented.")
)

(define (union x y)
	(display "Not yet implemented.")
)

(define (intersect x y)
  	(display "Not yet implemented.")
)

(define (det3x3 m)
	(display "Not yet implemented.") 
)