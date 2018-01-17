(apply + '(1 2 3 4))
(define (square x) (* x x))

(define ( sum x y) (+ x y))
(apply sum '(3 5))


(define (make-aware-thing)        			  
  (let ((root-part (make-root-object)))
    (lambda (msg)        			  
      (case msg        			  
	((AWARE?) (lambda (self) #t))
	((HEARD-NOISE) (lambda (self who) 'nothing))
	(else (find-method msg root-part))))))

(define wo 10)
(define mo 20)
(define (dosmt x y z)
  (set! wo (+ x y))
  (set! mo (* z y))
  (let ((as (list 4 5 6)))
    (set! as 100)
  (+ x y z as)))
(dosmt 3 4 5)
wo
mo