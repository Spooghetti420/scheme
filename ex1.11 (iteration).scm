; f(n) = n if n < 3, else f(n) = f(n-1) + 2f(n-2) + 3f(n-3).
(define (f-recursive n)
	(if (< n 3)
		n
		(+ 
		    (f-recursive (- n 1))
			(* (f-recursive (- n 2)) 2)
			(* (f-recursive (- n 3)) 3)
		)
	)
)

(define (<= x y)
    (or (< x y) (= x y))
)

(define (f-iter n)
	(define (next a b c)
		(+ a (* 2 b) (* 3 c))
	)

	(define (f-inner a b c count)
		(define n (next a b c))
		(if (= count 3)
			n
			(f-inner n a b (- count 1))
		)
	)
	(f-inner 2 1 0 n)
)