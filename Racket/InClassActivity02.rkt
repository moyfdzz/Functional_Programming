#lang racket

;P1
(define (fol x)
  (if (even? (length x))
    (car x)
    (car (reverse x))
  )
)

(fol '(1 2 3))

;P2
(define (third x)
  (if (> (length  x) 2)
    (list-ref x 2)
    '()
  )
)

(third '(1 2 3))

;P3
(define (toList a b c)
  (cons a (cons b (cons c '())))
)

(toList 1 2 3)

;P4
(define (palindrome? x)
  (equal? (string->list x) (reverse (string->list x)))
)

(palindrome? "ayaya")

;P5
(define (elementAt l i)
  (if (null? l)
    null
    (if (= i 0)
      (car l)
      (elementAt (cdr l) (- i 1))
    )
  )
)

(elementAt '(1 2 3) 1)

;P6
(define (sumList l)
  (if (null? l)
    0
    (if (number? (car l))
      (+ (car l) (sumList (cdr l)))
      (+ 0 (sumList (cdr l)))
    )
  )
)

(sumList '(1 2 3))

;P7
(define (appendElements a b)
  (if (and (list? a) (list? b))
    (append a b)
    (if (or (list? a) (list? b))
      '()
      (cons b (cons a '()))
    )
  )
)

(appendElements 1 2)

;P8
(define (evenElements l)
  (if (null? l)
    '()
    (cons (car l) (oddElements (cdr l)))
  )
)

(define (oddElements l)
  (if (null? l)
    '()
    (evenElements (cdr l))
  )
)

(oddElements '(1 2 3 4 5 6))