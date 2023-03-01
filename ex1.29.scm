(define (cube x) (* x x x))

(define (sum term a b inc coefficient)
    (define (sum-inner current running index)
        (if (> current b)
            running
            (sum-inner (+ current inc) (+ running (* (term current) (coefficient index))) (+ index 1))
        )
    )
    (sum-inner a 0 0)
)

;; Integral using Simpson's rule
(define (integral f n a b)
    (define (get-coefficient term)
        (cond
            ((or (= term 0) (= term n)) 1)
            ((= (remainder term 2) 1) 4)
            (else 2)
        )
    )
    (define h (/ (- b a) n))

    (* (/ h 3) (sum f a b h get-coefficient))
)

(integral cube 10 0 1)
