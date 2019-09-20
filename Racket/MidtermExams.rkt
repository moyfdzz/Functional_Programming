#lang racket

;==============================Midterm Exam 1================================

;Enigma A
(define (enigmaA1 x y)
  (if (null? x)
    (list y)
    (cons
      (cons
        (car (reverse x)) (list (car x)))
        (enigmaA1 (cdr x) (+ y 1))
    )
  )
)

;(enigmaA1 '(1 2 5) 0)
;(enigmaA1 '(6 7 2 4) 2)

;Enigma B
(define (enigmaB1 x y)
  (let ((a y)) 
    (let ((b x))
      (list
        (* a (+ b 1))
        (if (> a b) (list b) b)
      )
    )
  )
)

;(enigmaB1 5 10)
;(enigmaB1 10 5)

;Enigma C
(define (enigmaC1 x)
  (apply - (apply * 1 4 (append (map * x x) '(2 3))) '(100))
)

;(enigmaC1 '(2 3))
;(enigmaC1 '(1 -1 5))

(define (enigmaD1 x y)
  (- ((lambda (y) (- y 2)) x) y)
)

;(enigmaD1 4 7)
;(enigmaD1 3 9)

;P1

(define (uniqueElements x)
  (if (null? x)
    '()
    (if (member (car x) (cdr x))
      (uniqueElements (cdr x))
      (cons (car x) (uniqueElements (cdr x)))
    )
  )
)

;(uniqueElements '(1 2 1 2 1 2 3 3 3 3 2 1))

(define (engimaA2 x)
  (if (null? x)
    '()
    (cons (remainder (car x) (car (reverse x))) (engimaA2 (cdr x)))
  )
)

;(engimaA2 '(1 2 5))
;(engimaA2 '(6 7 2))

(define (enigmaC2 x)
  (apply * (apply + 1 2 3 4 (map * x x)) '(2))
)

;(enigmaC2 '(2))
;(enigmaC2 '(1 5))

(define (enigmaD2 x y)
  (let ((z (lambda (x) (+ x 2))))
    (- (z y) x)
  )
)

;(enigmaD2 4 7)
;(enigmaD2 3 9)