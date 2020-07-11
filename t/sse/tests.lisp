(in-package :fast-arithmetic-tests.sse)

(fiveam:def-suite sse-test-suite
    :description "Fast arithmetic SSE test suite.")

(fiveam:in-suite sse-test-suite)

(fiveam:test replicate-float
  (let ((x 1.0))
    (multiple-value-bind (v0 v1 v2 v3)
        (sb-ext:%simd-pack-singles (sse:replicate-float x))
      (fiveam:is (equalp v0 x))
      (fiveam:is (equalp v1 x))
      (fiveam:is (equalp v2 x))
      (fiveam:is (equalp v3 x)))))

(fiveam:test add-single
  (let* ((x 1.0)
        (y 2.0)
        (res (+ x y)))
    (multiple-value-bind (v0 v1 v2 v3)
        (sb-ext:%simd-pack-singles (sse:f4+ (sse:replicate-float x)
                                            (sse:replicate-float y)))
      (fiveam:is (equalp v0 res))
      (fiveam:is (equalp v1 res))
      (fiveam:is (equalp v2 res))
      (fiveam:is (equalp v3 res)))))

(fiveam:test mul-single
  (let* ((x 1.0)
        (y 2.0)
        (res (* x y)))
    (multiple-value-bind (v0 v1 v2 v3)
        (sb-ext:%simd-pack-singles (sse:f4* (sse:replicate-float x)
                                            (sse:replicate-float y)))
      (fiveam:is (equalp v0 res))
      (fiveam:is (equalp v1 res))
      (fiveam:is (equalp v2 res))
      (fiveam:is (equalp v3 res)))))

(fiveam:test sub-single
  (let* ((x 1.0)
        (y 2.0)
        (res (- x y)))
    (multiple-value-bind (v0 v1 v2 v3)
        (sb-ext:%simd-pack-singles (sse:f4- (sse:replicate-float x)
                                            (sse:replicate-float y)))
      (fiveam:is (equalp v0 res))
      (fiveam:is (equalp v1 res))
      (fiveam:is (equalp v2 res))
      (fiveam:is (equalp v3 res)))))

(fiveam:test replicate-double
  (let ((x 1.d0))
    (multiple-value-bind (v0 v1)
        (sb-ext:%simd-pack-doubles (sse:replicate-double x))
      (fiveam:is (equalp v0 x))
      (fiveam:is (equalp v1 x)))))

(fiveam:test add-double
  (let* ((x 1.d0)
        (y 2.d0)
        (res (+ x y)))
    (multiple-value-bind (v0 v1)
        (sb-ext:%simd-pack-doubles (sse:d2+ (sse:replicate-double x)
                                            (sse:replicate-double y)))
      (fiveam:is (equalp v0 res))
      (fiveam:is (equalp v1 res)))))

(fiveam:test mul-double
  (let* ((x 1.d0)
        (y 2.d0)
        (res (* x y)))
    (multiple-value-bind (v0 v1)
        (sb-ext:%simd-pack-doubles (sse:d2* (sse:replicate-double x)
                                            (sse:replicate-double y)))
      (fiveam:is (equalp v0 res))
      (fiveam:is (equalp v1 res)))))

(fiveam:test sub-double
  (let* ((x 1.d0)
        (y 2.d0)
        (res (- x y)))
    (multiple-value-bind (v0 v1)
        (sb-ext:%simd-pack-doubles (sse:d2- (sse:replicate-double x)
                                            (sse:replicate-double y)))
      (fiveam:is (equalp v0 res))
      (fiveam:is (equalp v1 res)))))

(defun run-tests ()
  (fiveam:run! 'sse-test-suite))
