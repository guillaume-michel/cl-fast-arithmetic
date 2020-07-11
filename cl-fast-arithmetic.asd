(defsystem "cl-fast-arithmetic"
  :description "Fast arithmetic functions in Common Lisp"
  :version "0.0.1"
  :author "Guillaume MICHEL <contact@orilla.fr>"
  :license "MIT license (see COPYING)"
  :in-order-to ((test-op (test-op "cl-fast-arithmetic-tests")))
  :components ((:static-file "COPYING")
               (:static-file "README.md")
               (:module "src/sse"
                        :serial t
                        :components ((:file "package")
                                     (:file "definitions")
                                     (:file "vops")
                                     (:file "intrinsics")
                                     (:file "sse")))
               (:module "src/avx2"
                        :serial t
                        :components ((:file "package")
                                     (:file "definitions")
                                     (:file "vops")
                                     (:file "intrinsics")
                                     (:file "avx2")))))
