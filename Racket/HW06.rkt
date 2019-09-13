#lang racket

;P1 Quicksort
(define (quickSort l)
  (if (null? l)
    '()
    (append
      (quickSort (filter (lambda (x) (<= x (car l))) (cdr l)))
      (list (car l))
      (quickSort (filter (lambda (x) (> x (car l))) (cdr l)))
    )
  )
)

;(quickSort '(6 7 2 1 3 4 0 5 9 8))

;P2 Matrix multiplication


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

(heightsAverage '(
  ("Male" 178) 
  ("Female" 165) 
  ("Female" 158) 
  ("Female" 182) 
  ("Male" 161) 
  ("Male" 175) 
  ("Female" 182) 
  ("Male" 188) 
  ("Male" 169) 
  ("Female" 156)
  )
)

;P4 Binary search trees
(define (insertBST x BST)
  
)

;P5 Is there a path between two specific nodes in a graph?
