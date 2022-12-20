(define (square x)
  (* x x))

(define (abs x)
    (if (> x 0)
        x
        (- x)
    )
)

(define (mean x y)
    (/ (+ x y) 2)
)

(define (<= x y)
    (or (< x y) (= x y))
)

(define (ratio-error actual approx)
    (/ (- approx actual) actual)
)

(define (percentage-error actual approx)
    (* (ratio-error actual approx) 100)
)

(define (cbrt x)
    (define (improve-guess guess)
        (/ (+ (/ x (square guess)) (* 2 guess)) 3)
    )
    (define (good-enough? guess improved-guess)
        (<= (abs (percentage-error guess improved-guess)) 0.1)
    )
    (define (cbrt-iter guess)
        (let ((improved (improve-guess guess)))
            (if (good-enough? guess improved)
                guess
                (cbrt-iter improved)
            )
        )
    )
    (cbrt-iter 1)
)