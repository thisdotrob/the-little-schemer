(define sub1
  (lambda (n)
    (- n 1)))

(define add1
  (lambda (n)
    (+ 1 n)))

(define o+
  (lambda (n1 n2)
    (cond ((zero? n2) n1)
          (else (o+ (add1 n1) (sub1 n2))))))

(define addtup
  (lambda (tup)
    (cond ((null? tup) 0)
          (else (o+ (car tup) (addtup (cdr tup)))))))

(define tup+
  (lambda (tup1 tup2)
    (cond ((null? tup1) tup2)
          ((null? tup2) tup1)
          (else (cons (o+ (car tup1) (car tup2)) (tup+ (cdr tup1) (cdr tup2)))))))
