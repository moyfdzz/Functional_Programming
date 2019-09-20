#lang racket

(define (strangeList x y z)
  (if (null? x)
    '()
    (cons (list (car x)(list (car y)(list (car z)))) (strangeList (cdr x) (cdr y) (cdr z)))
  )
)

;(strangeList '(1) '(2) '(3))
;(strangeList '(1 2 3) '(a b c) '(10 20 30))
;(strangeList '((1) a) '((2) b) '((3) c))

(define (sum x)
  ;(apply + (filter (lambda (y) (not (list? y)))x))
  (apply + (filter number? x)) ; Correcto para todos los casos
)

;(sum '(1 2 3 4 '(5) 6))

;Grafos

(define (find x y g)
  (cadar(filter (lambda (z) (equal? (car z) (list x y))g)))
)

#|
(find a b '(
  ((a b) 5)
  ((b c) 13)
  ((b d) 8)
  ((c d) 7)
)
) |#

;(cadar (((a b) 5)))
;(((a b) 5)) -> car -> ((a b) 5) -> cdr -> (5) -> car -> 5
;filter genera una lista
;cons elemento izquierda, lista derecha

; Eliminar repetidos (no jala)


(define (remove x)
  (if (null? x)
    '()
    (cons (car x) (remove (filter (lambda (z) (not (equal? z (car x)))) (cdr x) )))
  )
)

(remove '(1 2 1 2 1))


#|
  (cons 1 '(2 3)) = '(1 2 3)
  (cons '(1) '(2 3)) = '((1) 2 3)

  (list 1 '(2 3)) = '(1 (2 3))
  (list '(1) '(2 3)) = '((1) (2 3))
|#

; Grafos otra vez más jarcor
; Red neuronal

#|
  x = entradas
  w = pesos
  t = umbral (threshhold)
  (map * x w) regresa una lista con las multiplicaciones
|#

#|
(define (net x w t)
  (if (> (apply + (map * x w)) t)
    1
    0
  )
)
|#

; Árbol binario de operadores

#|
(define (arbolOp x)

)

(arbolOp '(+ (* (2 () ()) (7 () ()) ) (3 () ())))
|#