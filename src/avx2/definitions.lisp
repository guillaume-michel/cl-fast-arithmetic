(in-package :fast-arithmetic.avx2)

(sb-c:defknown (f8-load) ((cl:unsigned-byte 64) ;; index
                          sb-sys:system-area-pointer) ;; array sap
    (sb-ext:simd-pack-256 cl:single-float)
    (sb-c:movable sb-c:flushable sb-c:always-translatable)
  :overwrite-fndb-silently cl:t)

(sb-c:defknown (f8-store) ((cl:unsigned-byte 64) ;; index
                           sb-sys:system-area-pointer ;; array sap
                           (sb-ext:simd-pack-256 cl:single-float)) ;; register to save
    (cl:values)
    (sb-c:movable sb-c:always-translatable)
  :overwrite-fndb-silently cl:t)

(sb-c:defknown (f8+ f8* f8-) ((sb-ext:simd-pack-256 cl:single-float)
                              (sb-ext:simd-pack-256 cl:single-float))
  (sb-ext:simd-pack-256 cl:single-float)
  (sb-c:movable sb-c:flushable sb-c:always-translatable)
  :overwrite-fndb-silently cl:t)

(sb-c:defknown (f8-fma) ((sb-ext:simd-pack-256 cl:single-float)
                         (sb-ext:simd-pack-256 cl:single-float)
                         (sb-ext:simd-pack-256 cl:single-float))
  (sb-ext:simd-pack-256 cl:single-float)
  (sb-c:movable sb-c:flushable sb-c:always-translatable)
  :overwrite-fndb-silently cl:t)

(sb-c:defknown (d4-load) ((cl:unsigned-byte 64) ;; index
                          sb-sys:system-area-pointer) ;; array sap
    (sb-ext:simd-pack-256 cl:double-float)
    (sb-c:movable sb-c:flushable sb-c:always-translatable)
  :overwrite-fndb-silently cl:t)

(sb-c:defknown (d4-store) ((cl:unsigned-byte 64) ;; index
                           sb-sys:system-area-pointer ;; array sap
                           (sb-ext:simd-pack-256 cl:double-float)) ;; register to save
    (cl:values)
    (sb-c:movable sb-c:always-translatable)
  :overwrite-fndb-silently cl:t)

(sb-c:defknown (d4+ d4* d4-) ((sb-ext:simd-pack-256 cl:double-float)
                              (sb-ext:simd-pack-256 cl:double-float))
  (sb-ext:simd-pack-256 cl:double-float)
  (sb-c:movable sb-c:flushable sb-c:always-translatable)
  :overwrite-fndb-silently cl:t)

(sb-c:defknown (d4-fma) ((sb-ext:simd-pack-256 cl:double-float)
                         (sb-ext:simd-pack-256 cl:double-float)
                         (sb-ext:simd-pack-256 cl:double-float))
  (sb-ext:simd-pack-256 cl:double-float)
  (sb-c:movable sb-c:flushable sb-c:always-translatable)
  :overwrite-fndb-silently cl:t)
