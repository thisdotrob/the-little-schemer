(define sub1
  (lambda (n)
    (- n 1)))

(define o-
  (lambda (n1 n2)
    (cond ((zero? n2) n1)
          (else (o- (sub1 n1) (sub1 n2))))))
