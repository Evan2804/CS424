# CS424 Autumn 2015

## Q.1 Scheme:
#### Question:
Define a Scheme function after-filter which takes a predicate p and a list xs and returns a list of those elements of xs which immediately follow an element which passes the predicate p.

#### Answer:
``` Scheme
(define after-filter-number
  (λ (p l1)
    (cond
      ((null? l1) '())
      ((null? (cdr l1)) '())
      ((p (car l1))
       (cons (cadr l1) (after-filter-number p (cdr l1))))
      (else
       (after-filter-number p (cdr l1))))))
```

#### Example:
``` Scheme
(after-filter-number number? '(a b 2 3 c 4 d)) => '(3 c d)
(after-filter-number symbol? '(a b 2 3 c 4 d)) => '(b 2 4)
(after-filter-number symbol? '()) => '()
```

---

## Q.2 Haskell:
#### Question:
Define afterFilter in Haskell, with the same convention as the above Scheme function. Be sure to give it an approprate type signature.

#### Answer:
``` Haskell
afterFilter p l1
    | (null l1) = []
    | (null (tail l1)) = []
    | (p (head l1)) = (head (tail l1)) : (afterFilter p (tail l1))
    | otherwise = (afterFilter p (tail l1))
```

#### Example:
``` Haskell
afterFilter (<0) [-4,7,-4,-8,3,-3,-6,0,-9,-1] => [7,-8,3,-6,0,-1]
```

---
## Q.4 Prolog:
#### Question:
In Prolog, define a predicate doublemember/2 which takes a potential element and a list and is true when the element appears (at least) twice in the list.

#### Answer:
``` Prolog
doublemember(X,Y) :- doublemember(X,Y,0).
doublemember(_,[],N) :- N >= 2.
doublemember(X,[H|T],N) :- X==H, C is N + 1, doublemember(X,T,C).
doublemember(X,[H|T],N) :- X\=H, doublemember(X,T,N).
```

#### Example:
``` Prolog
doublememeber(a,[the,quick,brown,fox]). => false
doublememeber(a,[the,a,quick,brown,a,fox]). => false
doublememeber(a,[]). => false
doublememeber(a,[the,a,quick,brown,X,fox]). => X=a.
```
> Not finished! Code does not work for last example.
---