;; Using the definition from the book.
(define (fib-recursive n)
    (cond 
        ((= n 0) 0)
        ((= n 1) 1)
        (else (+ (fib-recursive (- n 1)) (fib-recursive (- n 2))))
    )
)

;; Iterative translation of the recursive form.
(define (fib-iter n)
    (define (fib-inner a b count)
        (if (= count 0)
            a
            (fib-inner (+ b a) a (- count 1))
        )
    )

    (fib-inner 0 1 n)
)

;; Formulaic method using Binet's formula.
;; F(n) = (φ^n + ψ^n)/√5    | where: φ = (1+√5)/2; ψ = (1-√5)/2
;; Since for n > 1, ψ^n is less than 1/2, it can be ignored in the formula and the floor function of the
;; first term + 1/2 can be taken instead. I would also try using the `round` function, but the online
;; interpreter is broken and doesn't support it.
;; I wanted to use `φ` as a variable name, but for some reason the interpreter didn't like it. "Computation timed out", it said.
(define (fib-binet n)
    (define phi 1.6180339887)
    (define sqrt-5 2.2360679775)
    (cond 
        ((= n 0) 0)
        ((= n 1) 1)
        (else (floor (+ 0.5 (/ (expt phi n) sqrt-5))))
    )
)