(in-package :sb-vm)

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
  (:results (r :scs (single-avx2-reg)))
  (:result-types simd-pack-256-single)
  (:generator 4
              (cond ((location= r y)
                     (inst vfmadd231ps r a x))
                    (t
                     (move r y)
                     (inst vfmadd231ps r a x)))))

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
  (:results (r :scs (double-avx2-reg)))
  (:result-types simd-pack-256-double)
  (:generator 4
              (cond ((location= r y)
                     (inst vfmadd231pd r a x))
                    (t
                     (move r y)
                     (inst vfmadd231pd r a x)))))
