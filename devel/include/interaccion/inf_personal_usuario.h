// Generated by gencpp from file interaccion/inf_personal_usuario.msg
// DO NOT EDIT!


#ifndef INTERACCION_MESSAGE_INF_PERSONAL_USUARIO_H
#define INTERACCION_MESSAGE_INF_PERSONAL_USUARIO_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace interaccion
{
template <class ContainerAllocator>
struct inf_personal_usuario_
{
  typedef inf_personal_usuario_<ContainerAllocator> Type;

  inf_personal_usuario_()
    : nombre()
    , edad(0)
    , idiomas()  {
    }
  inf_personal_usuario_(const ContainerAllocator& _alloc)
    : nombre(_alloc)
    , edad(0)
    , idiomas(_alloc)  {
  (void)_alloc;
    }



   typedef std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>> _nombre_type;
  _nombre_type nombre;

   typedef int32_t _edad_type;
  _edad_type edad;

   typedef std::vector<std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>>>> _idiomas_type;
  _idiomas_type idiomas;





  typedef boost::shared_ptr< ::interaccion::inf_personal_usuario_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::interaccion::inf_personal_usuario_<ContainerAllocator> const> ConstPtr;

}; // struct inf_personal_usuario_

typedef ::interaccion::inf_personal_usuario_<std::allocator<void> > inf_personal_usuario;

typedef boost::shared_ptr< ::interaccion::inf_personal_usuario > inf_personal_usuarioPtr;
typedef boost::shared_ptr< ::interaccion::inf_personal_usuario const> inf_personal_usuarioConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::interaccion::inf_personal_usuario_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::interaccion::inf_personal_usuario_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::interaccion::inf_personal_usuario_<ContainerAllocator1> & lhs, const ::interaccion::inf_personal_usuario_<ContainerAllocator2> & rhs)
{
  return lhs.nombre == rhs.nombre &&
    lhs.edad == rhs.edad &&
    lhs.idiomas == rhs.idiomas;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::interaccion::inf_personal_usuario_<ContainerAllocator1> & lhs, const ::interaccion::inf_personal_usuario_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace interaccion

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::interaccion::inf_personal_usuario_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::interaccion::inf_personal_usuario_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::interaccion::inf_personal_usuario_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::interaccion::inf_personal_usuario_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::interaccion::inf_personal_usuario_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::interaccion::inf_personal_usuario_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::interaccion::inf_personal_usuario_<ContainerAllocator> >
{
  static const char* value()
  {
    return "19f1abd21cc2347607f498eb3a5e0d34";
  }

  static const char* value(const ::interaccion::inf_personal_usuario_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x19f1abd21cc23476ULL;
  static const uint64_t static_value2 = 0x07f498eb3a5e0d34ULL;
};

template<class ContainerAllocator>
struct DataType< ::interaccion::inf_personal_usuario_<ContainerAllocator> >
{
  static const char* value()
  {
    return "interaccion/inf_personal_usuario";
  }

  static const char* value(const ::interaccion::inf_personal_usuario_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::interaccion::inf_personal_usuario_<ContainerAllocator> >
{
  static const char* value()
  {
    return "string nombre\n"
"int32 edad\n"
"string[] idiomas\n"
;
  }

  static const char* value(const ::interaccion::inf_personal_usuario_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::interaccion::inf_personal_usuario_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.nombre);
      stream.next(m.edad);
      stream.next(m.idiomas);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct inf_personal_usuario_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::interaccion::inf_personal_usuario_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::interaccion::inf_personal_usuario_<ContainerAllocator>& v)
  {
    s << indent << "nombre: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>>>::stream(s, indent + "  ", v.nombre);
    s << indent << "edad: ";
    Printer<int32_t>::stream(s, indent + "  ", v.edad);
    s << indent << "idiomas[]" << std::endl;
    for (size_t i = 0; i < v.idiomas.size(); ++i)
    {
      s << indent << "  idiomas[" << i << "]: ";
      Printer<std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>>>::stream(s, indent + "  ", v.idiomas[i]);
    }
  }
};

} // namespace message_operations
} // namespace ros

#endif // INTERACCION_MESSAGE_INF_PERSONAL_USUARIO_H
