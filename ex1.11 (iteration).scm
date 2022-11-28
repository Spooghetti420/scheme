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

; http://community.schemewiki.org/?sicp-ex-1.11
(define (f-iter n)

	(define (fi a b c count)
		(cond 
			((< n 3) n)
			((<= count 0) a)
			(else (fi (+ a (* 2 b) (* 3 c)) a b (- count 1)))
		)
	)
	(fi 2 1 0 (- n 2))
)