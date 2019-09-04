(define insertL
  (lambda (new old lat)
    (cond ((null? lat) '())
          ((eq? old (car lat)) (cons new lat))
          (else (cons (car lat) (insertL new old (cdr lat)))))))

(define insertR
  (lambda (new old lat)
    (cond ((null? lat) '())
          ((eq? old (car lat)) (cons old (cons new (cdr lat))))
          (else (cons (car lat) (insertR new old (cdr lat)))))))

(define multiinsertR
  (lambda (new old lat)
    (cond ((null? lat) (quote ()))
          ((eq? (car lat) old) (cons old (cons new (multiinsertR new old (cdr lat)))))
          (else (cons (car lat) (multiinsertR new old (cdr lat)))))))

(define insertR*
  (lambda (new old l)
    (cond ((null? l) '())
          ((eq? old (car l)) (cons old (cons new (insertR* new old (cdr l)))))
          ((atom? (car l)) (cons (car l) (insertR* new old (cdr l))))
          (else (cons (insertR* new old (car l)) (insertR* new old (cdr l)))))))

(define insertL*
  (lambda (new old l)
    (cond ((null? l) '())
          ((eq? old (car l)) (cons new (cons old (insertL* new old (cdr l)))))
          ((atom? (car l)) (cons (car l) (insertL* new old (cdr l))))
          (else (cons (insertL* new old (car l)) (insertL* new old (cdr l)))))))
