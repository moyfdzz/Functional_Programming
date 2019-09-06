#!/usr/bin/racket
#lang racket

(define (get n lst)
  (if (= n 0)
    (car lst)
    (get (- n 1) (cdr lst))
  )
)

(get 0 '("nel" 2 3 4 5))