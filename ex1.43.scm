(define (compose f g)
    ; returns the function composition of two one-argument functions f and g, i.e. f(g(x)).
    (lambda (x) (f (g x)))
)

(define (repeated f n)
    ; repeats a function of one argument, f, n times
    (define (repeat-loop current-f counter)
        (if (= counter n)
            current-f
            (repeat-loop (compose current-f f) (+ counter 1))
        )
    )

    (repeat-loop f 1)
)

(define (square x)
    (* x x)
)

((repeated square 2) 5)
