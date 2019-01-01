# CS424 January 2018

### Q.1 Scheme:
#### Question:
Define a Scheme function tear which takes two arguments, a predicate p? and a list xs, and returns a list of two lists, the first of which is the elements of xs that pass p?, and the second of which is the elements of xs that fail it, both in order.

#### Answer:
``` Scheme
(define tear
  (λ (p lst)
    (list
     (filter p lst)
     (filter (negate p) lst))))
```

#### Example:
``` Scheme
(tear number? '(a b c 1 2 3 d e f)) => ((1 2 3) (a b c d e f))
```

---
### Q.2 Haskell:
#### Question:
Define a Haskell function tear, including its type, which takes a predicate and a list and returns a list of two lists, the first
those elements of the input list which pass the predicate, the second those that don't, in order.

#### Answer:
``` Haskell
tear p lst = (filter (p) lst):[(filter (not.p) lst)]
```

#### Example:
``` Haskell
tear (>5) [1,10,2,12,3,13] => [[10,12,13],[1,2,3]]
```

---

### Q.3 Prolog:
#### Question:
Define a Prolog predicate mul/3 (+,+,-) which is true when, given three lists, the length of the third is the product of the lengths
of the first two.

#### Answer:
``` Prolog
mul(A,B,C) :-
 my_length(A,X),
 my_length(B,Y),
 my_length(C,Z),
 XY is X + Y,
 Z == XY.

my_length([],0).
my_length([_|T],Q) :-
  my_length(T,P),
  Q is P + 1.
```

#### Example:
``` Prolog
mul([a,b],[a,b,c],[w,x,y,z,p,d]) => yes
mul([a,b],[b,c],Xs) => Xs = [_,_,_,_,_,_]
```

---