;; 2018 January
(define tear
    (λ (p lst)
      (list
       (filter p lst)
       (filter (negate p) lst))))
  ;; Example => (tear number? '(a b c 1 2 3 d e f)) => ((1 2 3) (a b c d e f))
  
  ;; 2018 Autumn
  (define (map-skip p lst)
    (cond
      ((null? lst) '())
      ((null? (cdr lst)) (map p (lst)))
      (else
       (append (map p (list (car lst))) (cons (cadr lst) (map-skip p (cddr lst)))))))
  ;; Example => (map-skip (λ (x) (+ x 1000)) '(1 2 3 4 5 6)) => (1001 2 1003 4 1005 6)
  
  
  ;; 2017 January
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
  ;; Example => (foo number? '(a (2 (c 3) 4)))=> (2 3 4)
  
  
  ;; 2017 Autumn
  (define solver
    (λ (n m lst1 lst2)
      (cond
        ((null? lst1) lst2)
        ((null? lst2) lst1)
        ((= n m) (solver 0 (+ m 1) lst2 lst1))
        (else
         (cons (car lst1) (solver (+ n 1) m (cdr lst1) lst2)))))) 
  
  (define _foo
    (λ (lst1 lst2)
      (solver 0 1 lst1 lst2)))
  ;; Example => (_foo '(a b c d e f g) '(aa bb cc dd ee ff gg)) => (a aa bb b c d cc dd ee ff e f g gg)
  
  
  ;; 2016 January
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
  ;; Example => (reverse-with-count '(a b c) '(1 2 3)) => (c c c b b a)
  
  
  ;; 2016 Autumn
  (define tr
    (λ (lst)
      (cond
        ((null? (car lst)) '())
        ((null? lst) '())
        (else
         (cons (map car lst) (tr (map cdr lst)))))))
  ;; Example => (tr '((1 2 3) (4 5 6))) => ((1 4) (2 5) (3 6))
  
  
  ;; 2015 January
  (define after-filter-number
    (λ (p l1)
      (cond
        ((null? l1) '())
        ((null? (cdr l1)) '())
        ((p (car l1))
         (cons (cadr l1) (after-filter-number p (cdr l1))))
        (else
         (after-filter-number p (cdr l1))))))
  ;; Example => (after-filter-number number? '(a b 2 3 c 4 d)) => '(3 c d)
  
  ;; 2015 Autumn
  ;; See 2016 January