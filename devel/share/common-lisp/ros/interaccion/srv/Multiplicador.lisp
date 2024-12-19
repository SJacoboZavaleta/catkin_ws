; Auto-generated. Do not edit!


(cl:in-package interaccion-srv)


;//! \htmlinclude Multiplicador-request.msg.html

(cl:defclass <Multiplicador-request> (roslisp-msg-protocol:ros-message)
  ((entrada
    :reader entrada
    :initarg :entrada
    :type cl:integer
    :initform 0))
)

(cl:defclass Multiplicador-request (<Multiplicador-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Multiplicador-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Multiplicador-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name interaccion-srv:<Multiplicador-request> is deprecated: use interaccion-srv:Multiplicador-request instead.")))

(cl:ensure-generic-function 'entrada-val :lambda-list '(m))
(cl:defmethod entrada-val ((m <Multiplicador-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader interaccion-srv:entrada-val is deprecated.  Use interaccion-srv:entrada instead.")
  (entrada m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Multiplicador-request>) ostream)
  "Serializes a message object of type '<Multiplicador-request>"
  (cl:let* ((signed (cl:slot-value msg 'entrada)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Multiplicador-request>) istream)
  "Deserializes a message object of type '<Multiplicador-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'entrada) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Multiplicador-request>)))
  "Returns string type for a service object of type '<Multiplicador-request>"
  "interaccion/MultiplicadorRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Multiplicador-request)))
  "Returns string type for a service object of type 'Multiplicador-request"
  "interaccion/MultiplicadorRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Multiplicador-request>)))
  "Returns md5sum for a message object of type '<Multiplicador-request>"
  "d1d48bd1a6a0e98317f90b1d6ea7b6fa")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Multiplicador-request)))
  "Returns md5sum for a message object of type 'Multiplicador-request"
  "d1d48bd1a6a0e98317f90b1d6ea7b6fa")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Multiplicador-request>)))
  "Returns full string definition for message of type '<Multiplicador-request>"
  (cl:format cl:nil "int64 entrada~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Multiplicador-request)))
  "Returns full string definition for message of type 'Multiplicador-request"
  (cl:format cl:nil "int64 entrada~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Multiplicador-request>))
  (cl:+ 0
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Multiplicador-request>))
  "Converts a ROS message object to a list"
  (cl:list 'Multiplicador-request
    (cl:cons ':entrada (entrada msg))
))
;//! \htmlinclude Multiplicador-response.msg.html

(cl:defclass <Multiplicador-response> (roslisp-msg-protocol:ros-message)
  ((resultado
    :reader resultado
    :initarg :resultado
    :type cl:integer
    :initform 0))
)

(cl:defclass Multiplicador-response (<Multiplicador-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Multiplicador-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Multiplicador-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name interaccion-srv:<Multiplicador-response> is deprecated: use interaccion-srv:Multiplicador-response instead.")))

(cl:ensure-generic-function 'resultado-val :lambda-list '(m))
(cl:defmethod resultado-val ((m <Multiplicador-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader interaccion-srv:resultado-val is deprecated.  Use interaccion-srv:resultado instead.")
  (resultado m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Multiplicador-response>) ostream)
  "Serializes a message object of type '<Multiplicador-response>"
  (cl:let* ((signed (cl:slot-value msg 'resultado)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Multiplicador-response>) istream)
  "Deserializes a message object of type '<Multiplicador-response>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'resultado) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Multiplicador-response>)))
  "Returns string type for a service object of type '<Multiplicador-response>"
  "interaccion/MultiplicadorResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Multiplicador-response)))
  "Returns string type for a service object of type 'Multiplicador-response"
  "interaccion/MultiplicadorResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Multiplicador-response>)))
  "Returns md5sum for a message object of type '<Multiplicador-response>"
  "d1d48bd1a6a0e98317f90b1d6ea7b6fa")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Multiplicador-response)))
  "Returns md5sum for a message object of type 'Multiplicador-response"
  "d1d48bd1a6a0e98317f90b1d6ea7b6fa")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Multiplicador-response>)))
  "Returns full string definition for message of type '<Multiplicador-response>"
  (cl:format cl:nil "int64 resultado~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Multiplicador-response)))
  "Returns full string definition for message of type 'Multiplicador-response"
  (cl:format cl:nil "int64 resultado~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Multiplicador-response>))
  (cl:+ 0
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Multiplicador-response>))
  "Converts a ROS message object to a list"
  (cl:list 'Multiplicador-response
    (cl:cons ':resultado (resultado msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'Multiplicador)))
  'Multiplicador-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'Multiplicador)))
  'Multiplicador-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Multiplicador)))
  "Returns string type for a service object of type '<Multiplicador>"
  "interaccion/Multiplicador")