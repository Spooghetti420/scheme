(define (pascal n k)
    (if (or (= k 0) (= k n) (= n 0))
        1
        (+ (pascal (- n 1) (- k 1)) (pascal (- n 1) k))
    )
)


;; the same function as `pascal`, but using direct computation instead of recursion
(define (factorial n)
    (define (fact-iter count product)
        (if (> count n)
            product
            (fact-iter (+ count 1) (* product count))
        )
    )
    (fact-iter 1 1)
)


(define (binomial-coefficient n k)
    (
        / 
        (factorial n)
        (*
            (factorial r)
            (factorial (- n r))
        )
    )
)