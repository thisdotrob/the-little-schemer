(define eqan?
  (lambda (a1 a2)
    (cond ((number? a1) (= a1 a2))
          (else (eq? a1 a2)))))
