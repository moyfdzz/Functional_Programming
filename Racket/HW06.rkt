#lang racket

;P1 Quicksort
(define (quickSort lst)
  (if (null? lst)
    '()
    (append
      (quickSort (filter (lambda (x) (<= x (car lst))) (cdr lst)))
      (list (car lst))
      (quickSort (filter (lambda (x) (> x (car lst))) (cdr lst)))
    )
  )
)

;(quickSort '(6 7 2 1 3 4 0 5 9 8))

;P2 Matrix multiplication
(define (matMult m1 m2) 
  (map (lambda (x) (apply map (lambda y (apply + (map * x y))) m2)) m1)
)

;(matMult '((1 2 3) (4 5 6) (7 8 9)) '((1 2 3) (4 5 6) (7 8 9)))

;P3 Table Summarization
(define (heightsAverage tbl)
  (let ((maleHeights (filter (lambda (x) (string=? (car x) "Male")) tbl))
        (femaleHeights (filter (lambda (x) (string=? (car x) "Female")) tbl)))
    
    (append
      (list "Male" (/ (apply + (map cadr maleHeights)) (length maleHeights)))
      (list "Female" (/ (apply + (map cadr femaleHeights)) (length femaleHeights)))
    )
  )
)

;(heightsAverage '(
;  ("Male" 178) 
;  ("Female" 165) 
;  ("Female" 158) 
;  ("Female" 182) 
;  ("Male" 161) 
;  ("Male" 175) 
;  ("Female" 182) 
;  ("Male" 188) 
;  ("Male" 169) 
;  ("Female" 156)
;  )
;)

;P4 Binary search trees
(define (insert x BST)
  (if (null? BST)
    (list x '() '())
    (if (< (car BST) x)
      (list (car BST) (cadr BST) (insert x (caddr BST)))
      (list (car BST) (insert x (cadr BST)) (caddr BST))
    )
  )
)

;(insert 1 '()) ; '(1 () ())
;(insert 5 '(1 () ())) ; '(1 () (5 () ()))
;(insert 3 '(1 () (5 () ()))) ; '(1 () (5 (3 () ()) ()))
;(insert 6 '(1 () (5 (3 () ()) ()))) ; '(1 () (5 (3 () ()) (6 () ())))
;(insert 0 '(1 () (5 (3 () ()) (6 () ())))) ; '(1 (0 () ()) (5 (3 () ()) (6 () ())))

;P5 Is there a path between two specific nodes in a graph?
(define (pathExists? graph lst)
  (display "Not yet implemented.")
)