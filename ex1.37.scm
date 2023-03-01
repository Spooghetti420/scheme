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

; Note to self: complete iterative process solution

(cont-frac (lambda (i) 1.0) (lambda (i) 1.0) 100)