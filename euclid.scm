;; Euclid's algorithm (own implementation a priori)
(define (euclid a b)
    (let ((rem (remainder a b)))
        (if (= rem 0)
            b
            (euclid rem a)
        )
    )
)

;; Improved version (from the book)
(define (gcd a b)
    (if (= b 0)
        a
        (gcd b (remainder a b))
    )
)