(in-package :sb-vm)

(define-vop (fast-arithmetic.sse::f4+)
  (:translate fast-arithmetic.sse::f4+)
  (:policy :fast-safe)
  (:args (x :scs (single-sse-reg) :target r)
         (y :scs (single-sse-reg)))
  (:arg-types simd-pack-single
              simd-pack-single)
  (:results (r :scs (single-sse-reg)))
  (:result-types simd-pack-single)
  (:generator 4
    (cond ((location= r y)
           (inst addps y x))
          (t
           (move r x)
           (inst addps r y)))))

(define-vop (fast-arithmetic.sse::f4*)
  (:translate fast-arithmetic.sse::f4*)
  (:policy :fast-safe)
  (:args (x :scs (single-sse-reg) :target r)
         (y :scs (single-sse-reg)))
  (:arg-types simd-pack-single
              simd-pack-single)
  (:results (r :scs (single-sse-reg)))
  (:result-types simd-pack-single)
  (:generator 4
    (cond ((location= r y)
           (inst mulps y x))
          (t
           (move r x)
           (inst mulps r y)))))

(define-vop (fast-arithmetic.sse::f4-)
  (:translate fast-arithmetic.sse::f4-)
  (:policy :fast-safe)
  (:args (x :scs (single-sse-reg) :target r)
         (y :scs (single-sse-reg)))
  (:arg-types simd-pack-single simd-pack-single)
  (:results (r :scs (single-sse-reg) :from (:argument 0)))
  (:result-types simd-pack-single)
  (:generator 4
    (move r x)
    (inst subps r y)))

(define-vop (fast-arithmetic.sse::d2+)
  (:translate fast-arithmetic.sse::d2+)
  (:policy :fast-safe)
  (:args (x :scs (double-sse-reg) :target r)
         (y :scs (double-sse-reg)))
  (:arg-types simd-pack-double
              simd-pack-double)
  (:results (r :scs (double-sse-reg)))
  (:result-types simd-pack-double)
  (:generator 4
    (cond ((location= r y)
           (inst addpd y x))
          (t
           (move r x)
           (inst addpd r y)))))

(define-vop (fast-arithmetic.sse::d2*)
  (:translate fast-arithmetic.sse::d2*)
  (:policy :fast-safe)
  (:args (x :scs (double-sse-reg) :target r)
         (y :scs (double-sse-reg)))
  (:arg-types simd-pack-double
              simd-pack-double)
  (:results (r :scs (double-sse-reg)))
  (:result-types simd-pack-double)
  (:generator 4
    (cond ((location= r y)
           (inst mulpd y x))
          (t
           (move r x)
           (inst mulpd r y)))))

(define-vop (fast-arithmetic.sse::d2-)
  (:translate fast-arithmetic.sse::d2-)
  (:policy :fast-safe)
  (:args (x :scs (double-sse-reg) :target r)
         (y :scs (double-sse-reg)))
  (:arg-types simd-pack-double
              simd-pack-double)
  (:results (r :scs (double-sse-reg) :from (:argument 0)))
  (:result-types simd-pack-double)
  (:generator 4
    (move r x)
    (inst subpd r y)))
