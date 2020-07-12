(in-package :sb-vm)

(define-vop (fast-arithmetic.avx2::f8-load)
  (:translate fast-arithmetic.avx2::f8-load)
  (:policy :fast-safe)
  (:args (index :scs (unsigned-reg))
         (vector :scs (sap-reg)))
  (:arg-types unsigned-num
              system-area-pointer)
  (:results (r :scs (single-avx2-reg)))
  (:result-types simd-pack-256-single)
  (:generator
   1
   (inst vmovups
         r
         (ea 0 vector index 4))))

(define-vop (fast-arithmetic.avx2::f8-store)
  (:translate fast-arithmetic.avx2::f8-store)
  (:policy :fast-safe)
  (:args (index :scs (unsigned-reg))
         (vector :scs (sap-reg))
         (reg :scs (single-avx2-reg)))
  (:arg-types unsigned-num
              system-area-pointer
              simd-pack-256-single)
  (:generator
   1
   (inst vmovups
         (ea 0 vector index 4)
         reg)))

(define-vop (fast-arithmetic.avx2::f8-broadcast)
  (:translate fast-arithmetic.avx2::f8-broadcast)
  (:policy :fast-safe)
  (:args (value :scs (single-reg) :target r))
  (:arg-types single-float)
  (:results (r :scs (single-avx2-reg) :from (:argument 0)))
  (:result-types simd-pack-256-single)
  (:generator
   1
   (inst vbroadcastss r value)))

(define-vop (fast-arithmetic.avx2::f8+)
  (:translate fast-arithmetic.avx2::f8+)
  (:policy :fast-safe)
  (:args (x :scs (single-avx2-reg) :target r)
         (y :scs (single-avx2-reg)))
  (:arg-types simd-pack-256-single simd-pack-256-single)
  (:results (r :scs (single-avx2-reg)))
  (:result-types simd-pack-256-single)
  (:generator 4
              (inst vaddps r x y)))

(define-vop (fast-arithmetic.avx2::f8*)
  (:translate fast-arithmetic.avx2::f8*)
  (:policy :fast-safe)
  (:args (x :scs (single-avx2-reg) :target r)
         (y :scs (single-avx2-reg)))
  (:arg-types simd-pack-256-single
              simd-pack-256-single)
  (:results (r :scs (single-avx2-reg)))
  (:result-types simd-pack-256-single)
  (:generator 4
              (inst vmulps r x y)))

(define-vop (fast-arithmetic.avx2::f8-)
  (:translate fast-arithmetic.avx2::f8-)
  (:policy :fast-safe)
  (:args (x :scs (single-avx2-reg) :target r)
         (y :scs (single-avx2-reg)))
  (:arg-types simd-pack-256-single
              simd-pack-256-single)
  (:results (r :scs (single-avx2-reg) :from (:argument 0)))
  (:result-types simd-pack-256-single)
  (:generator 4
              (inst vsubps r x y)))

(define-vop (fast-arithmetic.avx2::f8-fma)
  (:translate fast-arithmetic.avx2::f8-fma)
  (:policy :fast-safe)
  (:args (y :scs (single-avx2-reg) :target r)
         (a :scs (single-avx2-reg))
         (x :scs (single-avx2-reg)))
  (:arg-types simd-pack-256-single
              simd-pack-256-single
              simd-pack-256-single)
  (:results (r :scs (single-avx2-reg) :from (:argument 0)))
  (:result-types simd-pack-256-single)
  (:generator 4
              (cond ((location= r y)
                     (inst vfmadd231ps r a x))
                    (t
                     (inst vfmadd231ps y a x)
                     (move r y)))))

(define-vop (fast-arithmetic.avx2::d4-load)
  (:translate fast-arithmetic.avx2::d4-load)
  (:policy :fast-safe)
  (:args (index :scs (unsigned-reg))
         (vector :scs (sap-reg)))
  (:arg-types unsigned-num
              system-area-pointer)
  (:results (r :scs (double-avx2-reg)))
  (:result-types simd-pack-256-double)
  (:generator
   1
   (inst vmovupd
         r
         (ea 0 vector index 8))))

(define-vop (fast-arithmetic.avx2::d4-store)
  (:translate fast-arithmetic.avx2::d4-store)
  (:policy :fast-safe)
  (:args (index :scs (unsigned-reg))
         (vector :scs (sap-reg))
         (reg :scs (double-avx2-reg)))
  (:arg-types unsigned-num
              system-area-pointer
              simd-pack-256-double)
  (:generator
   1
   (inst vmovupd
         (ea 0 vector index 8)
         reg)))

(define-vop (fast-arithmetic.avx2::d4-broadcast)
  (:translate fast-arithmetic.avx2::d4-broadcast)
  (:policy :fast-safe)
  (:args (value :scs (double-reg) :target r))
  (:arg-types double-float)
  (:results (r :scs (double-avx2-reg) :from (:argument 0)))
  (:result-types simd-pack-256-double)
  (:generator
   1
   (inst vbroadcastsd r value)))

(define-vop (fast-arithmetic.avx2::d4+)
  (:translate fast-arithmetic.avx2::d4+)
  (:policy :fast-safe)
  (:args (x :scs (double-avx2-reg) :target r)
         (y :scs (double-avx2-reg)))
  (:arg-types simd-pack-256-double simd-pack-256-double)
  (:results (r :scs (double-avx2-reg)))
  (:result-types simd-pack-256-double)
  (:generator 4
              (inst vaddpd r x y)))

(define-vop (fast-arithmetic.avx2::d4*)
  (:translate fast-arithmetic.avx2::d4*)
  (:policy :fast-safe)
  (:args (x :scs (double-avx2-reg) :target r)
         (y :scs (double-avx2-reg)))
  (:arg-types simd-pack-256-double
              simd-pack-256-double)
  (:results (r :scs (double-avx2-reg)))
  (:result-types simd-pack-256-double)
  (:generator 4
              (inst vmulpd r x y)))

(define-vop (fast-arithmetic.avx2::d4-)
  (:translate fast-arithmetic.avx2::d4-)
  (:policy :fast-safe)
  (:args (x :scs (double-avx2-reg) :target r)
         (y :scs (double-avx2-reg)))
  (:arg-types simd-pack-256-double
              simd-pack-256-double)
  (:results (r :scs (double-avx2-reg) :from (:argument 0)))
  (:result-types simd-pack-256-double)
  (:generator 4
              (inst vsubpd r x y)))

(define-vop (fast-arithmetic.avx2::d4-fma)
  (:translate fast-arithmetic.avx2::d4-fma)
  (:policy :fast-safe)
  (:args (y :scs (double-avx2-reg) :target r)
         (a :scs (double-avx2-reg))
         (x :scs (double-avx2-reg)))
  (:arg-types simd-pack-256-double
              simd-pack-256-double
              simd-pack-256-double)
  (:results (r :scs (double-avx2-reg) :from (:argument 0)))
  (:result-types simd-pack-256-double)
  (:generator 4
              (cond ((location= r y)
                     (inst vfmadd231pd r a x))
                    (t
                     (inst vfmadd231pd y a x)
                     (move r y)))))
