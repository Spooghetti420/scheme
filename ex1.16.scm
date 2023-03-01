(define (square x)
    (* x x)
)

;; Successive squaring algorithm
(define (ss b y)
    (cond 
        ((= y 0) 1)
        ((= (modulo y 2) 0) (square (ss b (floor (/ y 2)))))
        (else (* b (ss b (- y 1))))
        
    )
)

(define (ss-iter b y)
    ;; Want a * b^n is always constant. Let a = 1 at the start, and so if y = 0, it returns 1.
    (define (ss-inner b y a)
        (if (= y 0)
            a
            (if (= (modulo y 2) 0)
                (ss-inner (square b) (/ y 2) a)
                (ss-inner b (- y 1) (* a b))
            )
        )
    )

    (ss-inner b y 1)
)