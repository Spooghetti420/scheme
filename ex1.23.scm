(define (square x) (* x x))
;; Gets the smallest proper factor (will also be a prime factor) of n. The algorithm stops at sqrt(n), so
;; time complexity is O(sqrt(n)) and space complexity is O(1).
(define (smallest-factor n)

    (define (test-num k)
        (cond 
            ((> (square k) n) n)
            ((= (remainder n k) 0) k)
            (else (test-num (+ k 2)))
        )
    )
    (if (= (remainder n 2) 0)
        2
        (test-num 3)
    )
)