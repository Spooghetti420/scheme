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

(cond (= 1 1) 1)



(define e
    (+ 2 
        (cont-frac 
            (lambda (i) 1.0)
            (lambda (i)
                (cond
                    ((or (= i 1) (= i 3) (= i 4) (= i 6) (= i 7) (= i 9) (= i 10)) 1)
                    ((= i 2) 2)
                    ((= i 5) 4)
                    ((= i 8) 6)
                    ((= i 11) 8)
                )
            )
            11
        )
    )
)