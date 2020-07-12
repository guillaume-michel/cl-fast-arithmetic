(in-package :fast-arithmetic.sse)

(sb-c:defknown (f4-load) ((cl:unsigned-byte 64) ;; index
                          sb-sys:system-area-pointer) ;; array sap
    (sb-ext:simd-pack cl:single-float)
    (sb-c:movable sb-c:flushable sb-c:always-translatable)
  :overwrite-fndb-silently cl:t)

(sb-c:defknown (f4-store) ((cl:unsigned-byte 64) ;; index
                           sb-sys:system-area-pointer ;; array sap
                           (sb-ext:simd-pack cl:single-float)) ;; register to save
    (cl:values)
    (sb-c:movable sb-c:always-translatable)
  :overwrite-fndb-silently cl:t)

(sb-c:defknown (f4+ f4* f4-) ((sb-ext:simd-pack cl:single-float)
                              (sb-ext:simd-pack cl:single-float))
  (sb-ext:simd-pack cl:single-float)
  (sb-c:movable sb-c:flushable sb-c:always-translatable)
  :overwrite-fndb-silently cl:t)

(sb-c:defknown (d2-load) ((cl:unsigned-byte 64) ;; index
                          sb-sys:system-area-pointer) ;; array sap
    (sb-ext:simd-pack cl:double-float)
    (sb-c:movable sb-c:flushable sb-c:always-translatable)
  :overwrite-fndb-silently cl:t)

(sb-c:defknown (d2-store) ((cl:unsigned-byte 64) ;; index
                           sb-sys:system-area-pointer ;; array sap
                           (sb-ext:simd-pack cl:double-float)) ;; register to save
    (cl:values)
    (sb-c:movable sb-c:always-translatable)
  :overwrite-fndb-silently cl:t)

(sb-c:defknown (d2+ d2* d2-) ((sb-ext:simd-pack cl:double-float)
                              (sb-ext:simd-pack cl:double-float))
  (sb-ext:simd-pack cl:double-float)
  (sb-c:movable sb-c:flushable sb-c:always-translatable)
  :overwrite-fndb-silently cl:t)

