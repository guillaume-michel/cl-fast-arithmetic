(in-package :fast-arithmetic.avx2)

(cl:macrolet ((define-stub (name)
             `(cl:defun ,name (i ptr)
                (,name i ptr))))
  (define-stub f8-load)
  (define-stub d4-load))

(cl:macrolet ((define-stub (name)
             `(cl:defun ,name (i ptr reg)
                (,name i ptr reg))))
  (define-stub f8-store)
  (define-stub d4-store))

(cl:macrolet ((define-stub (name)
             `(cl:defun ,name (value)
                (,name value))))
  (define-stub f8-broadcast)
  (define-stub d4-broadcast))

(cl:macrolet ((define-stub (name)
             `(cl:defun ,name (x y)
                (,name x y))))
  (define-stub f8+)
  (define-stub f8*)
  (define-stub f8-)
  (define-stub d4+)
  (define-stub d4*)
  (define-stub d4-))

(cl:macrolet ((define-stub (name)
             `(cl:defun ,name (y a x)
                (,name y a x))))
  (define-stub f8-fma)
  (define-stub d4-fma))
