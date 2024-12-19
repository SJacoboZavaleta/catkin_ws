execute_process(COMMAND "/home/ueki/catkin_ws/build/interaccion/catkin_generated/python_distutils_install.sh" RESULT_VARIABLE res)

if(NOT res EQUAL 0)
  message(FATAL_ERROR "execute_process(/home/ueki/catkin_ws/build/interaccion/catkin_generated/python_distutils_install.sh) returned error code ")
endif()
