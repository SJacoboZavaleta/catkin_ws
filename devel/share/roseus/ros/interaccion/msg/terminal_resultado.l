;; Auto-generated. Do not edit!


(when (boundp 'interaccion::terminal_resultado)
  (if (not (find-package "INTERACCION"))
    (make-package "INTERACCION"))
  (shadow 'terminal_resultado (find-package "INTERACCION")))
(unless (find-package "INTERACCION::TERMINAL_RESULTADO")
  (make-package "INTERACCION::TERMINAL_RESULTADO"))

(in-package "ROS")
;;//! \htmlinclude terminal_resultado.msg.html


(defclass interaccion::terminal_resultado
  :super ros::object
  :slots (_nombre _edad_original _edad_doblada ))

(defmethod interaccion::terminal_resultado
  (:init
   (&key
    ((:nombre __nombre) "")
    ((:edad_original __edad_original) 0)
    ((:edad_doblada __edad_doblada) 0)
    )
   (send-super :init)
   (setq _nombre (string __nombre))
   (setq _edad_original (round __edad_original))
   (setq _edad_doblada (round __edad_doblada))
   self)
  (:nombre
   (&optional __nombre)
   (if __nombre (setq _nombre __nombre)) _nombre)
  (:edad_original
   (&optional __edad_original)
   (if __edad_original (setq _edad_original __edad_original)) _edad_original)
  (:edad_doblada
   (&optional __edad_doblada)
   (if __edad_doblada (setq _edad_doblada __edad_doblada)) _edad_doblada)
  (:serialization-length
   ()
   (+
    ;; string _nombre
    4 (length _nombre)
    ;; int32 _edad_original
    4
    ;; int32 _edad_doblada
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _nombre
       (write-long (length _nombre) s) (princ _nombre s)
     ;; int32 _edad_original
       (write-long _edad_original s)
     ;; int32 _edad_doblada
       (write-long _edad_doblada s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _nombre
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _nombre (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; int32 _edad_original
     (setq _edad_original (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _edad_doblada
     (setq _edad_doblada (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get interaccion::terminal_resultado :md5sum-) "49101232c08d138933c02a95cf8cf856")
(setf (get interaccion::terminal_resultado :datatype-) "interaccion/terminal_resultado")
(setf (get interaccion::terminal_resultado :definition-)
      "string nombre
int32 edad_original
int32 edad_doblada
")



(provide :interaccion/terminal_resultado "49101232c08d138933c02a95cf8cf856")


