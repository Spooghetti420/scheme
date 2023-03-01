(define (sin x)

    (define (is-small-enough)
        (< (abs x) 0.1)
    )
    (define (reduce x)
        (- 
            (* 3 x)
            (* 4 (cube x))
        )
    )

    (define (cube x)
        (* x x x)
    )

    (if (is-small-enough)
        x
        (reduce (sin (/ x 3)))
    )
)