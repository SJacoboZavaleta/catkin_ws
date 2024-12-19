// Auto-generated. Do not edit!

// (in-package interaccion.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class terminal_resultado {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.nombre = null;
      this.edad_original = null;
      this.edad_doblada = null;
    }
    else {
      if (initObj.hasOwnProperty('nombre')) {
        this.nombre = initObj.nombre
      }
      else {
        this.nombre = '';
      }
      if (initObj.hasOwnProperty('edad_original')) {
        this.edad_original = initObj.edad_original
      }
      else {
        this.edad_original = 0;
      }
      if (initObj.hasOwnProperty('edad_doblada')) {
        this.edad_doblada = initObj.edad_doblada
      }
      else {
        this.edad_doblada = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type terminal_resultado
    // Serialize message field [nombre]
    bufferOffset = _serializer.string(obj.nombre, buffer, bufferOffset);
    // Serialize message field [edad_original]
    bufferOffset = _serializer.int32(obj.edad_original, buffer, bufferOffset);
    // Serialize message field [edad_doblada]
    bufferOffset = _serializer.int32(obj.edad_doblada, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type terminal_resultado
    let len;
    let data = new terminal_resultado(null);
    // Deserialize message field [nombre]
    data.nombre = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [edad_original]
    data.edad_original = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [edad_doblada]
    data.edad_doblada = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.nombre);
    return length + 12;
  }

  static datatype() {
    // Returns string type for a message object
    return 'interaccion/terminal_resultado';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '49101232c08d138933c02a95cf8cf856';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string nombre
    int32 edad_original
    int32 edad_doblada
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new terminal_resultado(null);
    if (msg.nombre !== undefined) {
      resolved.nombre = msg.nombre;
    }
    else {
      resolved.nombre = ''
    }

    if (msg.edad_original !== undefined) {
      resolved.edad_original = msg.edad_original;
    }
    else {
      resolved.edad_original = 0
    }

    if (msg.edad_doblada !== undefined) {
      resolved.edad_doblada = msg.edad_doblada;
    }
    else {
      resolved.edad_doblada = 0
    }

    return resolved;
    }
};

module.exports = terminal_resultado;
