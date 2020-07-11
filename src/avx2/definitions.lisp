(in-package :fast-arithmetic.avx2)

(sb-c:defknown (f8+ f8* f8-) ((sb-ext:simd-pack-256 cl:single-float)
                              (sb-ext:simd-pack-256 cl:single-float))
  (sb-ext:simd-pack-256 cl:single-float)
  (sb-c:movable sb-c:flushable sb-c:always-translatable)
  :overwrite-fndb-silently cl:t)

(sb-c:defknown (d4+ d4* d4-) ((sb-ext:simd-pack-256 cl:double-float)
                              (sb-ext:simd-pack-256 cl:double-float))
  (sb-ext:simd-pack-256 cl:double-float)
  (sb-c:movable sb-c:flushable sb-c:always-translatable)
  :overwrite-fndb-silently cl:t)
