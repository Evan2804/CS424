# CS424 January 2016

## Q.1 Scheme:
#### Question:
Define  a  Scheme  function  reverse-with-count  which  takes  two lists,the  second  of  which  is  a  list  of  non-negative  integers  the samelength  as  the  first  list,  and  returns  a  list  of  elements  from thefirst  list,  in  reverse  order,  each  repeated  a  number  of  times asspecified by the corresponding element of the second list.

#### Answer:
``` Scheme
(define reverse-with-count
  (λ (p q)
    (cond
      ((null? p) '())
      ((= (car q) 0) (reverse-with-count (cdr p) (cdr q)))
      (else
       (append
        (reverse-with-count p (cons
                               (- (car q) 1)
                               (cdr q)))
        (cons (car p) '()))))))
```

#### Example:
``` Scheme
(reverse-with-count '(a b c) '(1 2 3)) => (c c c b b a)
(reverse-with-count '(d c b a) '(3 0 0 1)) => (a d d d)
```

---

## Q.2 Haskell:
#### Question:
Define a Haskell function weaveHunks which takes an int and two lists and weaves them together in hunks of the given Define  a  Haskell  function  revCount  which  takes  two  lists,  thesecond of which is a list of non-negative Ints the same length as the  first  list,  and  returns  a  list  of  elements  from  the  firstlist,  in reverse order, each repeated a number of times asspecified by the corresponding element of the second list. Be sure to include a type declaration for revCount.

#### Answer:
``` Haskell
revCount p q = (\x y -> replicate (last y) (charToString (last x)) 
                ++ if (null (tail x) /= True || null (tail y) /= True) 
                    then (revCount (take(length x-1)x) (take(length y-1)y)) else []) p q
```

#### Example:
``` Haskell
revCount ['a','b','c'] [1,2,3] => ['c','c','c','b','b','a']
revCount ['d','c','b','a'] [3,0,0,1] => ['a','d','d','d']
```

---
## Q.3 Prolog:
#### Question:
cDefine a Prolog predicate noah/3 which is true of three lists when corresponding  elements  of  the  first  two  lists,  which  are  of  the  same length are lined up two-by-two on the third list.

#### Answer:
``` Prolog
noah(X,Y,Z) :- noah(X,Y,Z,[]).
noah([],[],Z,A) :- Z == A.
noah([Xh|Xt],[Yh|Yt],Z,A) :-
  append(A,[Xh],B),
  append(B,[Yh],C),
  noah(Xt,Yt,Z,C).
```

#### Example:
``` Prolog
noah([],[],[]). => true.
noah([a,b,c,d],[aye,bee,sea,dee],[a,aya,b,bee,c,sea,d,dee]). => true.
```

---