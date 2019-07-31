(define x
  (lambda (n m)
    (cond ((zero? m) 0)
          (else (o+ n (x n (sub1 m)))))))
