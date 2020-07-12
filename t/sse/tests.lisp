(in-package :fast-arithmetic-tests.sse)

(declaim (inline simple-array-vector))
(defun simple-array-vector (array)
  (declare (simple-array array))
  (if (sb-kernel:array-header-p array)
      (sb-kernel:%array-data array)
      array))

(fiveam:def-suite sse-test-suite
    :description "Fast arithmetic SSE test suite.")

(fiveam:in-suite sse-test-suite)

(fiveam:test load-float
  (let ((x (make-array 8 :element-type 'single-float
                       :initial-contents '(0.0 1.0 2.0 3.0 4.0 5.0 6.0 7.0))))
    (multiple-value-bind (v0 v1 v2 v3)
        (sb-ext:%simd-pack-singles
         (let ((data-x (simple-array-vector x)))
           (sb-sys:with-pinned-objects (data-x)
             (let ((sap-x (sb-sys:vector-sap data-x)))
               (sse:f4-load 0 sap-x)))))
      (fiveam:is (equalp v0 0.0))
      (fiveam:is (equalp v1 1.0))
      (fiveam:is (equalp v2 2.0))
      (fiveam:is (equalp v3 3.0)))
    (multiple-value-bind (v0 v1 v2 v3)
        (sb-ext:%simd-pack-singles
         (let ((data-x (simple-array-vector x)))
           (sb-sys:with-pinned-objects (data-x)
             (let ((sap-x (sb-sys:vector-sap data-x)))
               (sse:f4-load 4 sap-x)))))
      (fiveam:is (equalp v0 4.0))
      (fiveam:is (equalp v1 5.0))
      (fiveam:is (equalp v2 6.0))
      (fiveam:is (equalp v3 7.0)))))

(fiveam:test store-float
  (let* ((val 10.0)
         (aval (make-array 8
                           :element-type 'single-float
                           :initial-element val))
         (x (make-array 8
                        :element-type 'single-float
                        :initial-contents '(0.0 1.0 2.0 3.0 4.0 5.0 6.0 7.0)))
         (data-x (simple-array-vector x)))
    (sb-sys:with-pinned-objects (data-x)
      (let ((sap-x (sb-sys:vector-sap data-x)))
        (sse:f4-store 0 sap-x (sse:replicate-float val))
        (sse:f4-store 4 sap-x (sse:replicate-float val))))
    (fiveam:is (equalp x aval))))

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

(fiveam:test load-double
  (let ((x (make-array 4 :element-type 'double-float
                       :initial-contents '(0.d0 1.d0 2.d0 3.d0))))
    (multiple-value-bind (v0 v1)
        (sb-ext:%simd-pack-doubles
         (let ((data-x (simple-array-vector x)))
           (sb-sys:with-pinned-objects (data-x)
             (let ((sap-x (sb-sys:vector-sap data-x)))
               (sse:d2-load 0 sap-x)))))
      (fiveam:is (equalp v0 0.d0))
      (fiveam:is (equalp v1 1.d0)))
    (multiple-value-bind (v0 v1)
        (sb-ext:%simd-pack-doubles
         (let ((data-x (simple-array-vector x)))
           (sb-sys:with-pinned-objects (data-x)
             (let ((sap-x (sb-sys:vector-sap data-x)))
               (sse:d2-load 2 sap-x)))))
      (fiveam:is (equalp v0 2.d0))
      (fiveam:is (equalp v1 3.d0)))))

(fiveam:test store-double
  (let* ((val 10.d0)
         (aval (make-array 4
                           :element-type 'double-float
                           :initial-element val))
         (x (make-array 4
                        :element-type 'double-float
                        :initial-contents '(0.d0 1.d0 2.d0 3.d0)))
         (data-x (simple-array-vector x)))
    (sb-sys:with-pinned-objects (data-x)
      (let ((sap-x (sb-sys:vector-sap data-x)))
        (sse:d2-store 0 sap-x (sse:replicate-double val))
        (sse:d2-store 2 sap-x (sse:replicate-double val))))
    (fiveam:is (equalp x aval))))

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
