(define subst
  (lambda (new old lat)
    (cond ((null? lat) '())
          ((eq? old (car lat)) (cons new (cdr lat)))
          (else (cons (car lat) (subst new old (cdr lat)))))))

(define subst2
  (lambda (new o1 o2 lat)
    (cond ((null? lat) '())
          ((or (eq? o2 (car lat))
               (eq? o1 (car lat))) (cons new (cdr lat)))
          (else (cons (car lat) (subst2 new old (cdr lat)))))))

(define multisubst
  (lambda (new old lat)
    (cond ((null? lat) (quote ()))
          ((eq? (car lat) old) (cons new (multisubst new old (cdr lat))))
          (else (cons (car lat) (multisubst new old (cdr lat)))))))

(define subst*
  (lambda (new old l)
    (cond ((null? l) '())
          ((eq? old (car l)) (cons new (subst* new old (cdr l))))
          ((atom? (car l)) (cons (car l) (subst* new old (cdr l))))
          (else (cons (subst* new old (car l)) (subst* new old (cdr l)))))))
