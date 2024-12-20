// Generated by gencpp from file interaccion/terminal_resultado.msg
// DO NOT EDIT!


#ifndef INTERACCION_MESSAGE_TERMINAL_RESULTADO_H
#define INTERACCION_MESSAGE_TERMINAL_RESULTADO_H


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
struct terminal_resultado_
{
  typedef terminal_resultado_<ContainerAllocator> Type;

  terminal_resultado_()
    : nombre()
    , edad_original(0)
    , edad_doblada(0)  {
    }
  terminal_resultado_(const ContainerAllocator& _alloc)
    : nombre(_alloc)
    , edad_original(0)
    , edad_doblada(0)  {
  (void)_alloc;
    }



   typedef std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>> _nombre_type;
  _nombre_type nombre;

   typedef int32_t _edad_original_type;
  _edad_original_type edad_original;

   typedef int32_t _edad_doblada_type;
  _edad_doblada_type edad_doblada;





  typedef boost::shared_ptr< ::interaccion::terminal_resultado_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::interaccion::terminal_resultado_<ContainerAllocator> const> ConstPtr;

}; // struct terminal_resultado_

typedef ::interaccion::terminal_resultado_<std::allocator<void> > terminal_resultado;

typedef boost::shared_ptr< ::interaccion::terminal_resultado > terminal_resultadoPtr;
typedef boost::shared_ptr< ::interaccion::terminal_resultado const> terminal_resultadoConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::interaccion::terminal_resultado_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::interaccion::terminal_resultado_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::interaccion::terminal_resultado_<ContainerAllocator1> & lhs, const ::interaccion::terminal_resultado_<ContainerAllocator2> & rhs)
{
  return lhs.nombre == rhs.nombre &&
    lhs.edad_original == rhs.edad_original &&
    lhs.edad_doblada == rhs.edad_doblada;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::interaccion::terminal_resultado_<ContainerAllocator1> & lhs, const ::interaccion::terminal_resultado_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace interaccion

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::interaccion::terminal_resultado_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::interaccion::terminal_resultado_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::interaccion::terminal_resultado_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::interaccion::terminal_resultado_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::interaccion::terminal_resultado_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::interaccion::terminal_resultado_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::interaccion::terminal_resultado_<ContainerAllocator> >
{
  static const char* value()
  {
    return "49101232c08d138933c02a95cf8cf856";
  }

  static const char* value(const ::interaccion::terminal_resultado_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x49101232c08d1389ULL;
  static const uint64_t static_value2 = 0x33c02a95cf8cf856ULL;
};

template<class ContainerAllocator>
struct DataType< ::interaccion::terminal_resultado_<ContainerAllocator> >
{
  static const char* value()
  {
    return "interaccion/terminal_resultado";
  }

  static const char* value(const ::interaccion::terminal_resultado_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::interaccion::terminal_resultado_<ContainerAllocator> >
{
  static const char* value()
  {
    return "string nombre\n"
"int32 edad_original\n"
"int32 edad_doblada\n"
;
  }

  static const char* value(const ::interaccion::terminal_resultado_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::interaccion::terminal_resultado_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.nombre);
      stream.next(m.edad_original);
      stream.next(m.edad_doblada);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct terminal_resultado_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::interaccion::terminal_resultado_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::interaccion::terminal_resultado_<ContainerAllocator>& v)
  {
    s << indent << "nombre: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>>>::stream(s, indent + "  ", v.nombre);
    s << indent << "edad_original: ";
    Printer<int32_t>::stream(s, indent + "  ", v.edad_original);
    s << indent << "edad_doblada: ";
    Printer<int32_t>::stream(s, indent + "  ", v.edad_doblada);
  }
};

} // namespace message_operations
} // namespace ros

#endif // INTERACCION_MESSAGE_TERMINAL_RESULTADO_H
