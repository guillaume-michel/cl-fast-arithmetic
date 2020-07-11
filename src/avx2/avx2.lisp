(in-package :fast-arithmetic.avx2)

(cl:deftype f8 ()
  '(sb-ext:simd-pack-256 cl:single-float))

(cl:declaim (cl:inline replicate-float))
(cl:defun replicate-float (x)
  (sb-ext:%make-simd-pack-256-single x x x x x x x x))

(cl:deftype d4 ()
  '(sb-ext:simd-pack-256 cl:double-float))

(cl:declaim (cl:inline replicate-double))
(cl:defun replicate-double (x)
  (sb-ext:%make-simd-pack-256-double x x x x))
