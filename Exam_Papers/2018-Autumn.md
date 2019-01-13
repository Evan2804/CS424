# CS424 Autumn 2018

### Q.1 Scheme:
#### Question:
Define a Scheme function map-skip which takes a function and a list and returns the result of applying the given function to
every other element of the given list, starting with the first element.

#### Answer:
``` Scheme
(define (map-skip p lst)
  (cond
    ((null? lst) '())
    ((null? (cdr lst)) (map p (lst)))
    (else
     (append (map p (list (car lst))) (cons (cadr lst) (map-skip p (cddr lst)))))))
```

#### Example:
``` Scheme
(map-skip (λ (x) (+ x 1000)) '(1 2 3 4 5 6)) => (1001 2 1003 4 1005 6)
```

---
### Q.2 Haskell
#### Question:
Define a Haskell function mapSkip which takes a function and a list and returns the result of applying the given function to every other element of the given list, starting with the first element. Be sure to include a type signature.

#### Answer:
``` Haskell
mapSkip p l1
    | (null l1) = []
    | (null (tail l1)) = (map p l1)
    | otherwise = p (head l1) : (head (tail l1)) :(mapSkip p (tail (tail l1)))
```
#### Example:
``` Haskell
mapSkip (+1000) [1..6] => [1001,2,1003,4,1005,6]
```
---
### Q.3 Prolog
#### Question:
Define a Prolog predicate scissor/4 which is true when a list (first arg) is split into two pieces (3rd and 4th arg) at a given element (third arg).

#### Answer:
``` Prolog
scissors([H|T],S,X,Y) :- H == S, X == [], T == Y.
scissors([H|T],S,[Xh|Xt],Y) :- H \= S, H == Xh, scissors(T,S,Xt,Y).
```
#### Example:
``` Prolog
scissors([a,b,c,d,e,f],c,[a,b],[d,e,f]). => true. 
```
<!--stackedit_data:
eyJoaXN0b3J5IjpbMzY4MDk5MjkzXX0=
-->