(define (derivative f x)
    ; d/dx (f(x)) approximately equals (f(x+0.0001) - f(x))/0.0001
    (define tolerance 0.0001)
    (/
        (-
            (f (+ x tolerance))
            (f x)
        )
        tolerance
    )
)

(define (newton-improve f current-guess)
    (-
        current-guess
        (/
            (f current-guess)
            (derivative f current-guess)
        )
    )
)

(derivative (lambda (x) (* x x)) 2)

(define (relative-error measured actual)
    (/
        (abs (- measured actual))
        actual
    )
)

(define (sqrt a)
    (define tolerance 0.001)
    (define (square x)
        (* x x)
    )

    (define (objective x)
        (- 
            (square x)
            a
        )
    )
    
    (define (improve guess)
        (newton-improve objective guess)
    )

    (define (sqrt-inner guess)
        (if (< (relative-error (* guess guess) a) tolerance)
            guess
            (sqrt-inner (improve guess))
        )
    )

    (cond 
        ((= a 0) 0)
        ((< a 0) (error "Cannot find the square root of a negative number"))
        (else (sqrt-inner 1))
    )
)

; x^2 = a, so x^2 - a = 0.
; f(x) = x^2 - a