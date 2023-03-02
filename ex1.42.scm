(define (compose f g)
    ; returns the function composition of two one-argument functions f and g, i.e. f(g(x)).
    (lambda (x) (f (g x)))
)

(define (square x)
    (* x x)
)

(define (inc x)
    (+ x 1)
)

((compose square inc) 6)
((compose inc square) 6)
