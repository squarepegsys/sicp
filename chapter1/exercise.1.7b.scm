(define (sqrt-iter guess x)

  (if (good-enough? guess x)
      guess
      (if (< (abs (- guess (improve guess x))) 0.0001) guess
             (sqrt-iter (improve guess x)
                        x)))
)
  

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (-
           (square guess) x)) 0.001))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(define (square x)
  (* x x ))

; function I wrote to help test this
(define (test-sqrt x)
  (abs (- x (square (sqrt x))))
  )

; my list of failures
(test-sqrt 2)
; -6.00730488242718e-6
(test-sqrt 3)
; -3.1887755102078e-4

; not sure these are large, but they fail
(test-sqrt (+ (square 17) 1))
; -3.37489312244088e-4
(test-sqrt (+ (square (* 121 2)) 1))
; 0.0104475822736276

;; Putting the check made it worse for large numbers and no change in smaller ones


           