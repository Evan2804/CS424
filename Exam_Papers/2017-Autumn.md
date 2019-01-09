# CS424 Autumn 2017

### Q.1 Scheme:
#### Question:
Define a Scheme function foothat takes two lists and yields a list combining all the elements in the two input lists, taking 1 from the first list, 2 from the second list, 3 from the first list, 4 from the second list, etc, until both are exhausted.

#### Answer:
``` Scheme
(define solver
  (λ (n m lst1 lst2)
    (cond
      ((null? lst1) lst2)
      ((null? lst2) lst1)
      ((= n m) (solver 0 (+ m 1) lst2 lst1))
      (else
       (cons (car lst1) (solver (+ n 1) m (cdr lst1) lst2)))))) 

(define foo
  (λ (lst1 lst2)
    (solver 0 1 lst1 lst2)))
```

#### Example:
``` Scheme
(foo '(a b c d e f g) '(aa bb cc dd ee ff gg)) => (a aa bb b c d cc dd ee ff e f g gg)
(foo '(a b c d e f g) '()) => (a b c d e f g)
(foo '() '(aa bb cc dd ee ff gg)) => (aa bb cc dd ee ff gg)
```

---

### Q.2 Haskell:
#### Question:
Define a Haskell function foo, including a type signature, that takes two lists and yields a list combining all the elements in the two input lists, taking 1 from the first list, 2 from the second list, 3 from the first list, 4 from the second list, etc,until both are exhausted.

#### Answer:
``` Haskell
foo :: Int -> Int -> [a] -> [a]
foo p q = solve 0 1 p q

solve :: Int -> Int -> [a] -> [a] -> [a]
solve n m p q
    | (null p) == True = q
    | (null q) == True = p
    | n == m = (solve 0 (m+1) (tail q) p)
    | otherwise = (head p) : (solve (n+1) m (tail p) q)
```

#### Example:
``` Haskell
foo [1,2,3,4,5,6,7,8] [11,12,13,14,15,16,17,18] => [1,11,12,2,3,4,13,14,15,16,5,6,7,8,17,18]
```

---

### Q.3 Prolog:
#### Question:
Define a Prolog predicate thrice/2which is true when its first argument appears three times in its second argument, which must be a list.

#### Answer:
``` Prolog
thrice(X,Y) :- thrice(X,Y,0).
thrice(_,[],Z) :- Z == 3.
thrice(X,[H|T],Z) :-
  H == X,
  C is Z + 1,
  thrice(X,T,C).

thrice(X,[H|T],Z) :-
  H \= X,
  thrice(X,T,Z).
```

#### Example:
``` Prolog
thrice(e,[t,h,e,b,e,a,t,b,e]). => yes
thrice(e,[t,h,e,b,e,a,t,b]). => no
```

---