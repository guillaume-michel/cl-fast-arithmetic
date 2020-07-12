(in-package :sb-vm)

(define-vop (fast-arithmetic.sse::f4-load)
  (:translate fast-arithmetic.sse::f4-load)
  (:policy :fast-safe)
  (:args (index :scs (unsigned-reg))
         (vector :scs (sap-reg)))
  (:arg-types unsigned-num
              system-area-pointer)
  (:results (r :scs (single-sse-reg)))
  (:result-types simd-pack-single)
  (:generator
   1
   (inst movaps
         r
         (ea 0 vector index 4))))

(define-vop (fast-arithmetic.sse::f4-store)
  (:translate fast-arithmetic.sse::f4-store)
  (:policy :fast-safe)
  (:args (index :scs (unsigned-reg))
         (vector :scs (sap-reg))
         (reg :scs (single-sse-reg)))
  (:arg-types unsigned-num
              system-area-pointer
              simd-pack-single)
  (:generator
   1
   (inst movaps
         (ea 0 vector index 4)
         reg)))

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

(define-vop (fast-arithmetic.sse::d2-load)
  (:translate fast-arithmetic.sse::d2-load)
  (:policy :fast-safe)
  (:args (index :scs (unsigned-reg))
         (vector :scs (sap-reg)))
  (:arg-types unsigned-num
              system-area-pointer)
  (:results (r :scs (double-sse-reg)))
  (:result-types simd-pack-double)
  (:generator
   1
   (inst movapd
         r
         (ea 0 vector index 8))))

(define-vop (fast-arithmetic.sse::d2-store)
  (:translate fast-arithmetic.sse::d2-store)
  (:policy :fast-safe)
  (:args (index :scs (unsigned-reg))
         (vector :scs (sap-reg))
         (reg :scs (double-sse-reg)))
  (:arg-types unsigned-num
              system-area-pointer
              simd-pack-double)
  (:generator
   1
   (inst movapd
         (ea 0 vector index 8)
         reg)))

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
