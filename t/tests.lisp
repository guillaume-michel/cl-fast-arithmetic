(in-package :fast-arithmetic-tests)

(defun run-tests ()
  (fast-arithmetic-tests.sse:run-tests)
  (fast-arithmetic-tests.avx2:run-tests))
