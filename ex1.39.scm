(define (cont-frac n d k)
    ; Get the k-th partial continued fraction, where n and d are functions that take 1 argument "i", returning the "i"th numerator and denominator of the repeated fraction.
    (define (cont-frac-inner count)
        (if (= count k)
            (/ (n count) (d count))
            (/ (n count) (+ (d count) (cont-frac-inner (+ count 1))))
        )
    )

    (cont-frac-inner 1)
)

(define (tan x)
    (define (d i)
        (- (* 2 i) 1)
    )
    (define (n i)
        (if (= i 1)
            x
            (* (- x) x)
        )
    )
    (cont-frac n d 10)
)