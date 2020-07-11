(defpackage #:fast-arithmetic.avx2
  (:nicknames :avx2)
  (:use )
  (:export
   #:f8
   #:replicate-float
   #:f8+
   #:f8*
   #:f8-
   #:f8-fma

   #:d4
   #:replicate-double
   #:d4+
   #:d4*
   #:d4-
   #:d4-fma
   ))
