(define (fixed-point f first-guess)
    (define tolerance 0.00001)
    (define (close-enough? v1 v2)
        (< (abs (- v1 v2)) tolerance)
    )

    (define (try guess)
        (display guess)
        (newline)
        (let ((next (f guess)))
            (if (close-enough? guess next)
                next
                (try next)
            )
        )
    )

    (try first-guess)
)

(define (average-damp f)
    (define (average a b)
        (/ (+ a b) 2)
    )
    (lambda (x) (average x (f x)))
)

(define (repeated f n)
    ; repeats a function of one argument, f, n times

    (define (compose f g)
        ; returns the function composition of two one-argument functions f and g, i.e. f(g(x)).
        (lambda (x) (f (g x)))
    )

    (define (repeat-loop current-f counter)
        (if (= counter n)
            current-f
            (repeat-loop (compose current-f f) (+ counter 1))
        )
    )

    (repeat-loop f 1)
)


(define (sqrt x)
    (fixed-point (average-damp (lambda (y) (/ x y))) 1.0)
)

(define (pow x y)
    ; x^y = e^(ln(x^y)) = e^(y lnx)
    (exp (* y (log x)))
)

(define (log_n n b)
    ; log_b(x) = ln(x)/ln(b)
    (/ (log n) (log b))
)

; Nth root    |    Number of average damps required
;     2       |                 1 
;     3       |                 1 
;     4       |                 2 
;     5       |                 2 
;     6       |                 2 
;     7       |                 2
;     8       |                 3 
;     9       |                 3
;    10       |                 3
;    11       |                 3
;    12       |                 3
;    13       |                 3
;    14       |                 3
;    15       |                 3
;    16       |                 4
; From this we can conclude that the number of average-damps required to calculate the nth root is floor(log_2(n))

(define (nth-root x n)
    (fixed-point ((repeated average-damp (floor (log_n n 2))) (lambda (y) (/ x (pow y (- n 1))))) 1.0)
)

(nth-root 32 5)