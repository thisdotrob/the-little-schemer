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
