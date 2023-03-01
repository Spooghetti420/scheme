(define (square x) (* x x))


;; Gets the smallest proper factor (will also be a prime factor) of n. The algorithm stops at sqrt(n), so
;; time complexity is O(sqrt(n)) and space complexity is O(1).
(define (smallest-factor n)
    (define (next k)
        (if (= k 2) 3 (+ k 2))
    )

    (define (test-num k)
        (cond 
            ((> (square k) n) n)
            ((= (remainder n k) 0) k)
            (else (test-num (next k)))
        )
    )
    (test-num 2)
)

(define (is-prime? n)
    (= (smallest-factor n) n)
)


(define (expmod b y mod)
    (define (expmod-inner b y a)
        (if (= y 0)
            a
            (if (= (modulo y 2) 0)
                (expmod-inner (square b) (/ y 2) a)
                (expmod-inner b (- y 1) (modulo (* a b) mod))
            )
        )
    )

    (expmod-inner b y 1)
)

(define (fermat-test n)
    (define (test k)
        (= (expmod k n n) k)
    )
    (test (+ 1 (random (- n 1))))
)

(define (fast-prime? n times)
    (cond 
        ((= times 0 ) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)
    )
)