(define (identity x) x)

(define (square x)
  (* x x))

(define (sum-of-squares x y)
    (+ (square x) (square y))
)

(define (abs x)
    (if (> x 0)
        x
        (- x)
    )
)

(define (factorial n)
    (define (fact-iter count product)
        (if (> count n)
            product
            (fact-iter (+ count 1) (* product count))
        )
    )
    (fact-iter 1 1)
)

(define (mean x y)
    (/ (+ x y) 2)
)

(define (>= x y)
    (or (> x y) (= x y))
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

(define (sqrt x)
    (define (improve-guess guess)
        (mean guess (/ x guess))
    )
    (define (good-enough? guess)
        (<= (abs (percentage-error x (square guess))) 1)
    )
    (define (sqrt-iter guess)
        (if (good-enough? guess)
            guess
            (sqrt-iter (improve-guess guess))
        )
    )
    (sqrt-iter 1)
)

(define (derivative f x)
    (let ((h 1e-3))
        (/
            (- 
                (f (+ x h))
                (f x)
            )
        	h
        )
    )
)

(define (sum start-value term-func inc-func pred)
    (define (sum-inner current-value current-total)
        (if (pred current-value)
            (sum-inner (inc-func current-value) (+ (term-func current-value) current-total))
            current-total
        )
    )
    (sum-inner start-value 0)
)