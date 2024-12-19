;; Auto-generated. Do not edit!


(when (boundp 'interaccion::Multiplicador)
  (if (not (find-package "INTERACCION"))
    (make-package "INTERACCION"))
  (shadow 'Multiplicador (find-package "INTERACCION")))
(unless (find-package "INTERACCION::MULTIPLICADOR")
  (make-package "INTERACCION::MULTIPLICADOR"))
(unless (find-package "INTERACCION::MULTIPLICADORREQUEST")
  (make-package "INTERACCION::MULTIPLICADORREQUEST"))
(unless (find-package "INTERACCION::MULTIPLICADORRESPONSE")
  (make-package "INTERACCION::MULTIPLICADORRESPONSE"))

(in-package "ROS")





(defclass interaccion::MultiplicadorRequest
  :super ros::object
  :slots (_entrada ))

(defmethod interaccion::MultiplicadorRequest
  (:init
   (&key
    ((:entrada __entrada) 0)
    )
   (send-super :init)
   (setq _entrada (round __entrada))
   self)
  (:entrada
   (&optional __entrada)
   (if __entrada (setq _entrada __entrada)) _entrada)
  (:serialization-length
   ()
   (+
    ;; int64 _entrada
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int64 _entrada
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _entrada (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _entrada) (= (length (_entrada . bv)) 2)) ;; bignum
              (write-long (ash (elt (_entrada . bv) 0) 0) s)
              (write-long (ash (elt (_entrada . bv) 1) -1) s))
             ((and (class _entrada) (= (length (_entrada . bv)) 1)) ;; big1
              (write-long (elt (_entrada . bv) 0) s)
              (write-long (if (>= _entrada 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _entrada s)(write-long (if (>= _entrada 0) 0 #xffffffff) s)))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int64 _entrada
#+(or :alpha :irix6 :x86_64)
      (setf _entrada (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _entrada (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;;
   self)
  )

(defclass interaccion::MultiplicadorResponse
  :super ros::object
  :slots (_resultado ))

(defmethod interaccion::MultiplicadorResponse
  (:init
   (&key
    ((:resultado __resultado) 0)
    )
   (send-super :init)
   (setq _resultado (round __resultado))
   self)
  (:resultado
   (&optional __resultado)
   (if __resultado (setq _resultado __resultado)) _resultado)
  (:serialization-length
   ()
   (+
    ;; int64 _resultado
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int64 _resultado
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _resultado (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _resultado) (= (length (_resultado . bv)) 2)) ;; bignum
              (write-long (ash (elt (_resultado . bv) 0) 0) s)
              (write-long (ash (elt (_resultado . bv) 1) -1) s))
             ((and (class _resultado) (= (length (_resultado . bv)) 1)) ;; big1
              (write-long (elt (_resultado . bv) 0) s)
              (write-long (if (>= _resultado 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _resultado s)(write-long (if (>= _resultado 0) 0 #xffffffff) s)))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int64 _resultado
#+(or :alpha :irix6 :x86_64)
      (setf _resultado (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _resultado (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;;
   self)
  )

(defclass interaccion::Multiplicador
  :super ros::object
  :slots ())

(setf (get interaccion::Multiplicador :md5sum-) "d1d48bd1a6a0e98317f90b1d6ea7b6fa")
(setf (get interaccion::Multiplicador :datatype-) "interaccion/Multiplicador")
(setf (get interaccion::Multiplicador :request) interaccion::MultiplicadorRequest)
(setf (get interaccion::Multiplicador :response) interaccion::MultiplicadorResponse)

(defmethod interaccion::MultiplicadorRequest
  (:response () (instance interaccion::MultiplicadorResponse :init)))

(setf (get interaccion::MultiplicadorRequest :md5sum-) "d1d48bd1a6a0e98317f90b1d6ea7b6fa")
(setf (get interaccion::MultiplicadorRequest :datatype-) "interaccion/MultiplicadorRequest")
(setf (get interaccion::MultiplicadorRequest :definition-)
      "int64 entrada
---
int64 resultado
")

(setf (get interaccion::MultiplicadorResponse :md5sum-) "d1d48bd1a6a0e98317f90b1d6ea7b6fa")
(setf (get interaccion::MultiplicadorResponse :datatype-) "interaccion/MultiplicadorResponse")
(setf (get interaccion::MultiplicadorResponse :definition-)
      "int64 entrada
---
int64 resultado
")



(provide :interaccion/Multiplicador "d1d48bd1a6a0e98317f90b1d6ea7b6fa")


