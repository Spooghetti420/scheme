(define (double a) (+ a a))
(define (halve a) (/ a 2))

(define (mult a b)
    (define (mult-inner a b k)
        (if (= b 0)
            k
            (if (= (modulo b 2) 0)
                (mult-inner (double a) (halve b) k)
                (mult-inner a (- b 1) (+ k a))
            )
        )
    )

    (mult-inner a b 0)
)