(define (max a b)
    (if (> a b)
        a
        b
    )
)

(define (min a b)
    (if (< a b)
        a
        b
    )
)

(define (square a)
    (* a a)
)

;; Take 3 numbers and return the sum of the squares of the two larger ones
(define (sum-of-squares-of-two-largest a b c)
    (let (
            (x (max a (max b c)))
            (y (min (max a b) (max b c)))
        )
        (+ (square x) (square y))

    )
)