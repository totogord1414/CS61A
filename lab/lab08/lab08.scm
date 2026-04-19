(define (over-or-under num1 num2) (
  if (> num1 num2) 1
      (if (= num1 num2) 0
        -1)
))

(define (composed f g) (lambda (x) (f (g x))))

(define (repeat f n) (lambda (x) 
    (if (= n 0) x
                ((composed (repeat f (- n 1)) f) x))))

(define (max a b)
  (if (> a b)
      a
      b))

(define (min a b)
  (if (> a b)
      b
      a))

(define (gcd a b) 
      (if (zero? (modulo (max a b) (min a b))) (min a b)
                 (gcd (min a b) (modulo (max a b) (min a b)))))

(define (exp b n)
  (define (helper n so-far) 
  (if (= n 0) so-far
              (helper (- n 1) (* b so-far))))
  (helper n 1))

(define (swap s) 
  (define (swap_helper s swapped)
    (if (or (null? s) (null? (cdr s)))
        (append swapped s) 
        (begin (define swapped (append swapped (list (car (cdr s))))) (define swapped (append swapped (list(car s)))) (define s (cdr (cdr s))) (swap_helper s swapped)))
    )
  
  (swap_helper s nil))


(define (make-adder num) 
    (define (adder_helper x)
        (+ num x)
    (adder_helper)))
