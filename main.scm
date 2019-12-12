(define (contains? x s)
  (cond
    ((null? s) #F)
    ((= x (car s)) #T)
    (else (contains? x (cdr s)))
  )
)
(contains? 3 '(1 3 5))

(define (is-empty s)
  (cond
    ((null? s) #T)
    (else #F)
  )
)
(is-empty '())

(define (singleton-set x)
  (cons x '())
)
(singleton-set 3)

(define (intersection s1 s2)
  (cond
    ((null? s2) '())
    ((contains? (car s2) s1)
      (cons (car s2) (intersection s1 (cdr s2)))
    )
    (else
      (intersection s1 (cdr s2))
    )
  )
)
(intersection '(1 2 3) '(1 3 5))

(define (union s1 s2)
  (cond
    ((null? s2) s1)
    ((contains? (car s2) s1)
      (union s1 (cdr s2))
    )
    (else 
      (cons (car s2) (union s1 (cdr s2)))
    )
  )
)
(union '(1 2 3) '(1 3 5))

(define (filter s p)
  (cond
    ((null? s) '())
    ((p (car s))
      (cons (car s) (filter (cdr s) p))
    )
    (else
      (filter (cdr s) p)
    )
  )
)
(filter '(1 2 3 4 5) (lambda (x) (< x 3)))

