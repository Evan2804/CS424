;; Define poly-eval where (poly-eval p x)
;; evaluates the poylnomial p at the point x

(define poly-eval
  (λ (p x)
    (cond
      ((= (length p) 0) 0)
      ((= (length p) 1) (car p))
      (else
       (+(car p)(* x (poly-eval (cdr p) x)))))))


;; Define poly-add, a polynomial addition routine,
;; where (poly-add p1 p2) returns sum of the two
;; polynomials it is passed

(define poly-add
  (λ (p1 p2)
    (cond
      ((null? p1) p2)
      ((null? p2) p1)
      (else
       (cons (+ (car p1)(car p2))
             (poly-add (cdr p1)(cdr p2)))))))


;; Define poly-mul, a polynomial addition routine,
;; so (poly-mul p1 p2) returns the product of two polynomials

(define multiplier
  (lambda (p x)
    (cond
      ((null? p) '())
      (else
       (cons (* x (car p)) (multiplier (cdr p) x))))))

(define poly-mul
  (lambda (p1 p2)
    (cond
      ((null? p2) '())
      ((null? p1) '())
      (else
       (poly-add (multiplier p1 (car p2))
                 (poly-mul
                  (append '(0) p1) (cdr p2)))))))


;; Define poly-diff, a derivative-taking routine,
;; where (poly-diff p) returns the polynomial which,
;; is the derivative of the one it is passed.

(define diff
  (λ (x p)
    (cond
      ((null? p) '())
      (else
       (cons (* (car p) x)(diff (+ x 1) (cdr p)))))))

(define poly-diff
  (λ (p)
    (cond
      ((null? p) '())
      ((= (length p) 1) '())
      (else
       (diff 1 (cdr p))))))


;; Define the poly-int, an integration rountine,
;; where (poly-int p) returns the anti-derviative
;; of the polynomial p, with a constant term of zero.

(define poly-inter
  (λ (x p)
    (cond
      ((null? p) '())
      (else
       (cons (/ (car p) x)(poly-inter (+ x 1) (cdr p)))))))


(define poly-int
  (λ (p)
    (cond
      ((null? p) '())
      (else
       (cons 0 (poly-inter 1 p))))))


;; Define grovel-poly-eval where (grovel-poly-eval s x) takes
;; an s-expression s and a number s, and throughout s
;; (even if deeply nested) replaces list that begins witht the
;; symbol poly with the result of poly-eval of th remainder of
;; a list beginning with the symbol poly is a valid polynomial

(define grovel-poly-eval
  (λ (s x)
    (cond
      ((null? s) '())
      ((list? (car s))
       (cons
        (cond
          ((equal? (car (car s)) 'poly)
           (poly-eval (cdr (car s)) x))
          (else
           (cons (car (car s)) (grovel-poly-eval (cdr (car s)) x))))
        (grovel-poly-eval (cdr s) x)))
      (else
       (cons (car s) (grovel-poly-eval (cdr s) x))))))
