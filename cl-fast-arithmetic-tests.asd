(defsystem "cl-fast-arithmetic-tests"
  :description "cl-fast-arithmetic unit tests"
  :author "Guillaume MICHEL <contact@orilla.fr>"
  :license "MIT license (see COPYING)"
  :depends-on ("cl-fast-arithmetic"
               "fiveam")
  :perform (test-op (o s) (uiop:symbol-call :fast-arithmetic-tests :run-tests))
  :components ((:module "t/sse"
                :serial t
                :components ((:file "package")
                             (:file "tests")))
               (:module "t/avx2"
                :serial t
                :components ((:file "package")
                             (:file "tests")))
               (:module "t"
                :serial t
                :components ((:file "package")
                             (:file "tests")))))
