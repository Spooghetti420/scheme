;; T_pq(a, b): 
;;  a ⟵ bq + aq + ap = a'
;;  b ⟵ bp + aq = b'

;; T_pq(a', b'):
;; a' ⟵ b'q + a'q + a'p = (bp + aq)q + (bq + aq + ap)q + (bq + aq + ap)p
;; b' ⟵ b'p + a'q = (bp + aq)p + (bq + aq + ap)q

;; a'' = bpq + aq^2 + bq^2 + aq^2 + apq + bpq + apq + ap^2
;;          = 2bpq + 2apq + 2aq^2 + bq^2 + ap^2
;;          = b(2qp+q^2)+a(q^2+p^2)+a(2qp+q^2)
;; b'' = bp^2 + aqp + bq^2 + aq^2 + apq = 2apq + aq^2 + bq^2 + bp^2
;;     = b(p^2+q^2)+a(2qp+q^2)
;; Thus p'' = p^2 + q^2, and q'' = 2pq + q^2


(define (square x) (* x x))
(define (sum-of-squares x y) (+ (square x) (square y)))

(define (fib n)
  (fib-iter 1 0 0 1 n))

(define (fib-iter a b p q count)
    (cond ((= count 0) b)
        ((even? count)
         (fib-iter a
                   b
                   (sum-of-squares p q)
                   (* q (+ (* 2 p) q))
                   (/ count 2)))
        (else (fib-iter (+ (* b q) (* a q) (* a p))
                        (+ (* b p) (* a q))
                        p
                        q
                        (- count 1))
        )
    )
)

(fib 5)