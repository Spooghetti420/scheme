(define (accumulate-filtered filter? combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (combiner result 
        
        (if (filter? a)
            (term a)
            null-value
        )
        
        ))))
  (iter a null-value)
)

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
    (and (= (smallest-factor n) n) (not (= n 1)))
)

(define (inc x) (+ x 1))

;; Sum of squares of primes
(define (prime-square-sum a b)
    (accumulate-filtered is-prime? + 0 square a inc b)
)

(define (gcd a b)
    (if (= b 0)
        a
        (gcd b (remainder a b))
    )
)

;; Product of integers below n relatively prime to n
(define (coprime-product-below n)
    (define (identity x) x)
    (define (are-coprime? x)
        (= (gcd n x) 1)
    )
    (accumulate-filtered are-coprime? * 1 identity 1 inc n)
)