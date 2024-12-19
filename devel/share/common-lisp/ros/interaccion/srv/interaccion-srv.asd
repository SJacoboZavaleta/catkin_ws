
(cl:in-package :asdf)

(defsystem "interaccion-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "Multiplicador" :depends-on ("_package_Multiplicador"))
    (:file "_package_Multiplicador" :depends-on ("_package"))
  ))