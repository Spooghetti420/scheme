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


(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime))
)

(define (start-prime-test n start-time)
  (if (is-prime? n)
      (report-prime (- (runtime) start-time)))
)

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time)
)

(define (search-for-primes start)
    (define (search current found)
        (timed-prime-test (+ start 1))
        (if (is-prime? current)
            (search (+ current 2) (+ found 1))
            (search (+ current 2) found)
        )
    )
    (search (+ start 1) 0)
)