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

(display "Normal method") (newline)
(fixed-point (lambda (x) (/ (log 1000) (log x))) 4)

(display "Average damping") (newline)
(fixed-point (lambda (x) (/ (+ (/ (log 1000) (log x)) (* 2 x)) 3)) 4)
