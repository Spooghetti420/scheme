(define (smooth f)
    ; takes a single-variable function f and returns a smoothed function, which is one where its value is the average of f(x), f(x-dx) and f(x+dx) for some small dx
    (define dx 0.0001)
    (define (triple-average a b c)
        (/ (+ a b c) 3)
    )

    (lambda (x)
        (triple-average (f (- x dx)) (f x) (f (+ x dx)))
  	)
)

(define (repeated f n)
    ; repeats a function of one argument, f, n times

    (define (compose f g)
        ; returns the function composition of two one-argument functions f and g, i.e. f(g(x)).
        (lambda (x) (f (g x)))
    )

    (define (repeat-loop current-f counter)
        (if (= counter n)
            current-f
            (repeat-loop (compose current-f f) (+ counter 1))
        )
    )

    (repeat-loop f 1)
)


(define (n-fold-smooth f n)
    ; gets the n-fold smoothed function f by smoothing it n times
    ((repeated smooth n) f)
)

(define (square x) (* x x))
((n-fold-smooth square 2) 2)