# CS424 January 2017

### Q.1 Scheme:
#### Question:
Define a Scheme function foo which finds all atoms inside ans-expression which pass a given predicate.

#### Answer:
``` Scheme
(define flat
  (λ (lst)
    (cond
      ((null? lst) '())
      ((list? (car lst))
        (append (flat (car lst)) (flat (cdr lst))))
      (else
       (cons (car lst) (flat(cdr lst)))))))

(define foo
  (λ (p lst)
    (cond
      ((pair? lst) (filter p (flat lst)))
      (else
        (filter p (cons lst '()))))))
```

#### Example:
``` Haskell
(foo number? '(a (2 (c 3) 4)))=> (2 3 4)
(foo symbol? '(a (2 (c 3) 4)))=> (a c)
(foo symbol? 'a)=> (a)
(foo number? 'a)=> ()
```

---

### Q.2 Haskell:
#### Question:
Define a Haskell function weaveHunks which takes an int and two lists and weaves them together in hunks of the given size.  Be sure to declare its type signature.

#### Answer:
``` Haskell
weaveHunks :: Int -> [a] -> [a] -> [a]
weaveHunks n p q = (\x y -> take n x ++ take n q ++ 
                    if (null (drop n x) /= True || null (drop n y) /= True) 
                        then (weaveHunks n (drop n x) (drop n y)) else []) p q
```

##### Or

``` Haskell
weaveHunks :: Int -> [a] -> [a] -> [a]
weaveHunks n p q
    | (null p) = q
    | (null q) = p
    | otherwise = take n p ++ take n q ++ (weaveHunks n (drop n p) (drop n q))
```

#### Example:
``` Haskell
weaveHunks 2 [1..10] [11..20] => [1,2,11,12,3,4,13,14,5,6,15,16,7,8,17,18,9,10,19,20]
```

---