(in-package :fast-arithmetic.sse)

(cl:deftype f4 ()
  '(sb-ext:simd-pack cl:single-float))

(cl:declaim (cl:inline replicate-float))
(cl:defun replicate-float (x)
  (sb-ext:%make-simd-pack-single x x x x))

(cl:deftype d2 ()
  '(sb-ext:simd-pack cl:double-float))

(cl:declaim (cl:inline replicate-double))
(cl:defun replicate-double (x)
  (sb-ext:%make-simd-pack-double x x))
