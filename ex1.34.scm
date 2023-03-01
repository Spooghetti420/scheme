(define (f g) 
    (g 2)
)

(f square)

(f (lambda (z) (* z (+ z 1))))

(define (square x)
    (* x x)
)

; f(f) would invoke (f 2), which would then invoke (2 2), and since 2 is not a function, it cannot be called, resulting in an error.