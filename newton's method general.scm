(define (derivative f)
    (define h 0.0001)
    (lambda (x)
        (/
            (- (f (+ x h)) (f x))
            h
        )
    )
)

(define (newton-transform g)
    (lambda (x)
        (- x 
        (/ (g x) ((derivative g) x)))
    )

)

(define (fixed-point f first-guess)
    (define tolerance 0.00001)
    (define (close-enough? v1 v2)
        (< (abs (- v1 v2)) tolerance)
    )

    (define (try guess)
        (display guess)
        (newline)
        (let ((next (f guess)))
            (if (close-enough? guess next)
                next
                (try next)
            )
        )
    )

    (try first-guess)
)

(define (newtons-method g guess)
    (fixed-point (newton-transform g) guess)
)

(define (sqrt x)
(newtons-method (lambda (y) (- (square y) x))
1.0))