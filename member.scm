(define member*
  (lambda (a l)
    (cond ((null? l) #f)
          ((eq? a (car l)) #t)
          ((atom? (car l)) (member* a (cdr l)))
          (else (or (member* a (car l)) (member* a (cdr l)))))))
