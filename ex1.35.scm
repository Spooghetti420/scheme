; Golden ratio is defined such that x^2-x-1=0,
; so x^2=x+1, x=1+1/x.

(define (fixed-point f first-guess)
    (define tolerance 0.00001)
    (define (close-enough? v1 v2)
        (< (abs (- v1 v2)) tolerance)
    )

    (define (try guess)
        (let ((next (f guess)))
            (if (close-enough? guess next)
                next
                (try next)
            )
        )
    )

    (try first-guess)
)

(define golden-ratio (fixed-point (lambda (x) (+ 1 (/ 1 x))) 1.5))