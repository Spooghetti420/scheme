(define (double f)
    ; returns a function that applies f twice. f has one parameter.
    (lambda (arg) (f (f arg)))
)

(define (inc x)
    (+ x 1)
)

((double inc) 1)
(((double (double double)) inc) 5)