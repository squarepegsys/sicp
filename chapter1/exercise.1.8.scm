(define (cubert-iter guess x)
  (if (good-enough? guess x)
      guess
      (cubert-iter (improve guess x)
                 x))
  )

(define (improve guess x)
  (/ (+ (/ x (square guess)) (* 2 guess))
     3)
  )

(define (good-enough? guess x)
  (< (abs (-
           (cube guess) x)) 0.0000000001))

(define (cubert x)
  (cubert-iter 1.0 x))

(define (cube x)
  (* x x x))

(define (square y)
  (* y y )
  )

(define (test-cubert x)
  (abs (- x (cube (cubert x))))
  )


(test-cubert 8)
; 0.0
(test-cubert 23)
; 1.06581410364015e-14
(test-cubert 52)
; 5.71276359551121e-12
       