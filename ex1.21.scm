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

(smallest-factor 199)   ;; 199
(smallest-factor 1999)  ;; 1999
(smallest-factor 19999) ;; 7