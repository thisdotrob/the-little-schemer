(define pick
  (lambda (n lat)
    (cond ((zero? (sub1 n)) (car lat))
          (else (pick (sub1 n) (cdr lat))))))

(define rempick
  (lambda (n lat)
    (cond ((one? n) (cdr lat))
          (else (cons (car lat) (rempick (sub1 n) (cdr lat)))))))
