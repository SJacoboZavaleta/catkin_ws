;; Auto-generated. Do not edit!


(when (boundp 'interaccion::inf_personal_usuario)
  (if (not (find-package "INTERACCION"))
    (make-package "INTERACCION"))
  (shadow 'inf_personal_usuario (find-package "INTERACCION")))
(unless (find-package "INTERACCION::INF_PERSONAL_USUARIO")
  (make-package "INTERACCION::INF_PERSONAL_USUARIO"))

(in-package "ROS")
;;//! \htmlinclude inf_personal_usuario.msg.html


(defclass interaccion::inf_personal_usuario
  :super ros::object
  :slots (_nombre _edad _idiomas ))

(defmethod interaccion::inf_personal_usuario
  (:init
   (&key
    ((:nombre __nombre) "")
    ((:edad __edad) 0)
    ((:idiomas __idiomas) (let (r) (dotimes (i 0) (push "" r)) r))
    )
   (send-super :init)
   (setq _nombre (string __nombre))
   (setq _edad (round __edad))
   (setq _idiomas __idiomas)
   self)
  (:nombre
   (&optional __nombre)
   (if __nombre (setq _nombre __nombre)) _nombre)
  (:edad
   (&optional __edad)
   (if __edad (setq _edad __edad)) _edad)
  (:idiomas
   (&optional __idiomas)
   (if __idiomas (setq _idiomas __idiomas)) _idiomas)
  (:serialization-length
   ()
   (+
    ;; string _nombre
    4 (length _nombre)
    ;; int32 _edad
    4
    ;; string[] _idiomas
    (apply #'+ (mapcar #'(lambda (x) (+ 4 (length x))) _idiomas)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _nombre
       (write-long (length _nombre) s) (princ _nombre s)
     ;; int32 _edad
       (write-long _edad s)
     ;; string[] _idiomas
     (write-long (length _idiomas) s)
     (dolist (elem _idiomas)
       (write-long (length elem) s) (princ elem s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _nombre
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _nombre (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; int32 _edad
     (setq _edad (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; string[] _idiomas
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _idiomas (make-list n))
     (dotimes (i n)
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setf (elt _idiomas i) (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
     ))
   ;;
   self)
  )

(setf (get interaccion::inf_personal_usuario :md5sum-) "19f1abd21cc2347607f498eb3a5e0d34")
(setf (get interaccion::inf_personal_usuario :datatype-) "interaccion/inf_personal_usuario")
(setf (get interaccion::inf_personal_usuario :definition-)
      "string nombre
int32 edad
string[] idiomas

")



(provide :interaccion/inf_personal_usuario "19f1abd21cc2347607f498eb3a5e0d34")


