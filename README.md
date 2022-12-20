# Scheme Dumping Grounds
Here you will find my various codings in the Scheme programming language. I am learning it because it is featured
in the well-known computer science book "Structure and Interpretation of Computer Programs", so I'm attempting to solve
the exercises from the book in here.

Here is the Scheme interpreter that I use to run my code: https://inst.eecs.berkeley.edu/~cs61a/fa14/assets/interpreter/scheme.html

## Notes from the book

### Applicative-order vs Normal-order evaluation strategies
This site (https://www.senexion.com/blog/sicp/applicative-vs-normal/) does a good job at explaining the difference
between the two most logical ways to evaluate an expression in Scheme like `(square (+ 3 4))`:
_normal-order_ has us evaluate the _operator_ (`square` in this case) as much us possible, until all that's
left are primitive operators like `+` or `*`. At each stage, directly substitute the arguments for their formal parameters,
i.e. we would get `(* (+ 3 4) (+ 3 4))` in this case. Left with only primitive operators, the expression can now be evaluted.
_applicative-order_ evaluates the operands first, and then substitutes them into the body of the operator.
In other words, the result would instead be `(* 7 7)`, as the `(+ 3 4)` would be evaluated first and then
substituted directly into the formal parameter of the `square` function.

In Exercise 1.5, we have this here problem:
```
Ben Bitdiddle has invented a test to determine whether the interpreter he is faced with is using applicative-order evaluation or normal-order evaluation. He defines the following two procedures:

(define (p) (p))

(define (test x y)
  (if (= x 0)
      0
      y))

Then he evaluates the expression

(test 0 (p))

What behavior will Ben observe with an interpreter that uses applicative-order evaluation? What behavior will he observe with an interpreter that uses normal-order evaluation? Explain your answer.
```
The answer is that given applicative-order evaluation, the 0 would evaluate to 0 and the (p) would evaluate to (p),
and subsequently these would be substituted into `(if (= x 0) 0 y))`, giving `(if (= 0 0) 0 (p)))`; now, the if-statement evaluates to true, so the 0 is returned.
In normal-order evaluation, the interpreter will try to simplify all operators to primitive
ones, so the expression will first substitute to `(if (= 0 0) 0 (p)))`. So far so good—but
the definition of `(p)` remains unexpanded (because `p` is a procedure, so `p` is also
an operator), so this needs to be expanded out; however, `(p)` always evaluates to itself,
so in normal-order evaluation, this expression will never compute.