#lang racket

;=====================In-class activity 02==================================

;P1 If the length of the list is even, return first element, otherwise, return last element
(define (evenLength? lst)
  (if (even? (length lst))
    (car lst)
    (car (reverse lst))
  )
)

;(evenLength? '(1 2 3 4))

;P2 Return third element in a list if it exists, else empty list
(define (thirdElement lst)
  (if (>= (length lst) 3)
    (list-ref lst 2)
    '()
  )
)

;(thirdElement '(1 2 3))

;P3 Three elements into a list without list or append
(define (intoList a b c)
  (cons a (cons b (cons c '())))
)

;(intoList 1 2 3)

;P4 Check if a string is a palindrome
(define (palindrome? word)
  (equal? (string->list word) (reverse (string->list word)))
)

;(palindrome? "anitalavalatina")

;P5 Return element at position in list
(define (elementAt lst i)
  (if (null? lst)
    null
    (if (= i 0)
      (car lst)
      (elementAt (cdr lst) (- i 1))
    )
  )
)

;(elementAt '(1 2 3) 2)

;P6 Sum all numbers in a list
(define (sumList lst)
  (if (null? lst)
    0
    (if (number? (car lst))
      (+ (car lst) (sumList (cdr lst)))
      (sumList (cdr lst))
    )
  )
)

;(sumList '(1 b 2))

;P7 Append two elements 
(define (appendElements a b)
  (if (and (list? a) (list? b))
    (append a b)
    (if (or (list? a) (list? b))
      (list a b)
      (list b a)
    )
  )
)

;(appendElements '(1 2 3) 4)

;P8 Elements at odd positions
(define (evenElements lst)
  (if (null? lst)
    '()
    (cons (car lst) (oddElements (cdr lst)))
  )
)

(define (oddElements lst)
  (if (null? lst)
    '()
    (evenElements (cdr lst))
  )
)

(oddElements '(1 2 3))

;=====================In-class activity 03==================================

;Analyzing the code

;(- (+ 5 (* 8 9)) 20)
;(if #f (display "A") (display "B"))
;(cons '() '())
(caadr (cadr '(a (b (c d)))))