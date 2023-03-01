(define (product term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* result (term a)))))
  (iter a 1)
)

(define (product-recursive term a next b)
    (if (> a b)
        1
        (* (term a) (product-recursive term (next a) next b))
    )
)

(define (identity x) x)
(define (inc x) (+ x 1))
(define (factorial n)
    (product identity 2 n inc)
)

(define (plus-two x) (+ x 2))
(define (pi-term x)
    (/ (* (+ x 1) (- x 1)) (* x x))
)

(define pi
    (* 4 (product pi-term 3 plus-two 30))
)
