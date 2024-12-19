; Auto-generated. Do not edit!


(cl:in-package interaccion-msg)


;//! \htmlinclude terminal_resultado.msg.html

(cl:defclass <terminal_resultado> (roslisp-msg-protocol:ros-message)
  ((nombre
    :reader nombre
    :initarg :nombre
    :type cl:string
    :initform "")
   (edad_original
    :reader edad_original
    :initarg :edad_original
    :type cl:integer
    :initform 0)
   (edad_doblada
    :reader edad_doblada
    :initarg :edad_doblada
    :type cl:integer
    :initform 0))
)

(cl:defclass terminal_resultado (<terminal_resultado>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <terminal_resultado>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'terminal_resultado)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name interaccion-msg:<terminal_resultado> is deprecated: use interaccion-msg:terminal_resultado instead.")))

(cl:ensure-generic-function 'nombre-val :lambda-list '(m))
(cl:defmethod nombre-val ((m <terminal_resultado>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader interaccion-msg:nombre-val is deprecated.  Use interaccion-msg:nombre instead.")
  (nombre m))

(cl:ensure-generic-function 'edad_original-val :lambda-list '(m))
(cl:defmethod edad_original-val ((m <terminal_resultado>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader interaccion-msg:edad_original-val is deprecated.  Use interaccion-msg:edad_original instead.")
  (edad_original m))

(cl:ensure-generic-function 'edad_doblada-val :lambda-list '(m))
(cl:defmethod edad_doblada-val ((m <terminal_resultado>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader interaccion-msg:edad_doblada-val is deprecated.  Use interaccion-msg:edad_doblada instead.")
  (edad_doblada m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <terminal_resultado>) ostream)
  "Serializes a message object of type '<terminal_resultado>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'nombre))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'nombre))
  (cl:let* ((signed (cl:slot-value msg 'edad_original)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'edad_doblada)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <terminal_resultado>) istream)
  "Deserializes a message object of type '<terminal_resultado>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'nombre) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'nombre) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'edad_original) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'edad_doblada) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<terminal_resultado>)))
  "Returns string type for a message object of type '<terminal_resultado>"
  "interaccion/terminal_resultado")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'terminal_resultado)))
  "Returns string type for a message object of type 'terminal_resultado"
  "interaccion/terminal_resultado")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<terminal_resultado>)))
  "Returns md5sum for a message object of type '<terminal_resultado>"
  "49101232c08d138933c02a95cf8cf856")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'terminal_resultado)))
  "Returns md5sum for a message object of type 'terminal_resultado"
  "49101232c08d138933c02a95cf8cf856")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<terminal_resultado>)))
  "Returns full string definition for message of type '<terminal_resultado>"
  (cl:format cl:nil "string nombre~%int32 edad_original~%int32 edad_doblada~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'terminal_resultado)))
  "Returns full string definition for message of type 'terminal_resultado"
  (cl:format cl:nil "string nombre~%int32 edad_original~%int32 edad_doblada~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <terminal_resultado>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'nombre))
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <terminal_resultado>))
  "Converts a ROS message object to a list"
  (cl:list 'terminal_resultado
    (cl:cons ':nombre (nombre msg))
    (cl:cons ':edad_original (edad_original msg))
    (cl:cons ':edad_doblada (edad_doblada msg))
))
