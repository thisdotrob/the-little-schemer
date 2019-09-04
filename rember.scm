(define multirember
  (lambda (a l)
    (cond ((null? l) (quote ()))
          ((eq? a (car l)) (multirember a (cdr l)))
          (else (cons (car l) (multirember a (cdr l)))))))

(define rember*
  (lambda (a l)
    (cond ((null? l) '())
          ((eq? a (car l)) (rember* a (cdr l)))
          ((atom? (car l)) (cons (car l) (rember* a (cdr l))))
          (else (cons (rember* a (car l)) (rember* a (cdr l)))))))
