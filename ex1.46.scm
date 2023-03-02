(define (iterative-improve good-enough? improve)
    ; returns a function that iteratively improves a guess (its parameter) using the `improve` function, stopping once the predicate `good-enough?` is met
    ; both `improve` and `good-enough?` take 1 argument

    (define (improve-loop current)
        (let 
            ((next (improve current)))
            
            (if (good-enough? current next)
                next
                (improve-loop next)
            )
        )
    )
    (lambda (x)
        (improve-loop x)
    )
)

(define (average x y)
(/ (+ x y) 2))

(define (sqrt x)
    (define (square x) (* x x))
    (define (good-enough? guess next)
        (< (abs (- (square guess) x)) 0.001)
    )
    (define (improve guess)
        (average guess (/ x guess))
    )
    ((iterative-improve good-enough? improve) x)
)

(define (fixed-point f first-guess)
    (define tolerance 0.0000001)
    (define (close-enough? v1 v2)
        (< (abs (- v1 v2)) tolerance)
    )

    ((iterative-improve close-enough? f) first-guess)
)

(fixed-point cos 0.6)