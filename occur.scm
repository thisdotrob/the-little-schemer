(define occur
  (lambda (a lat)
    (cond ((null? lat) 0)
          ((eqan? a (car lat)) (add1 (occur a (cdr lat))))
          (else (occur a (cdr lat))))))

(define occur*
  (lambda (a lat)
    (cond ((null? lat) 0)
          ((eqan? a (car lat)) (add1 (occur* a (cdr lat))))
          ((atom? (car lat)) (occur* a (cdr lat)))
          (else (o+ (occur* a (car lat)) (occur* a (cdr lat)))))))
