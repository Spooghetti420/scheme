(define (ackermann x y)
    (cond
        ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (ackermann 
                (- x 1)
                (ackermann x (- y 1))
            )
        )
    )
)

(ackermann 1 10)
(ackermann 2 4)
(ackermann 3 3)

(define (f n) (ackermann 0 n)) ;; 2n
(define (g n) (ackermann 1 n)) ;; 2^n
(define (h n) (ackermann 2 n)) ;; 2^(h(n-1))