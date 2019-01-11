# CS424 January 2016

## Q.1 Haskell:
#### Question:
Define a function tr which takes a list of lists, all of the samelength, and returns their "transpose", meaning a list of lists ofthe first elements, the second elements, etc.  (All lists in testcases can be assumed to be non-empty.)  Be sure to include a type signature.

#### Answer:
``` Haskell
tr :: [[a]] -> [[a]]
tr([]:_) = []
tr x = (map head x) : tr (map tail x)
```

#### Example:
``` Haskell
tr [[1,2,3],[4,5,6]]=>[[1,4],[2,5],[3,6]]
tr ["foxes","socks","rocks"]=>["fsr","ooo","xcc","ekk","sss"]
```

---

## Q.2 Scheme:
#### Question:
Define a function tr which takes a list of lists, all of the samelength, and returns their "transpose", meaning a list of lists ofthe first elements, the second elements, etc.  (All lists in testcases can be assumed to be non-empty.)

#### Answer:
``` Haskell
(define tr
  (λ (lst)
    (cond
      ((null? (car lst)) '())
      ((null? lst) '())
      (else
       (cons (map car lst) (tr (map cdr lst)))))))
```

#### Example:
``` Haskell
(tr '((1 2 3) (4 5 6))) => ((1 4) (2 5) (3 6))
(tr '((f o x e s) (s o c k s) (r o c k s))) => ((f s r) (o o o) (x c c) (e k k) (s s s))
```

---
