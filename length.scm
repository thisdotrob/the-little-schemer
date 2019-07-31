(define length
  (lambda (lat)
    (cond ((null? lat) 0)
          (else (add1 (length (cdr lat)))))))
