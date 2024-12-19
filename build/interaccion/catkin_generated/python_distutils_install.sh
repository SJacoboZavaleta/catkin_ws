#!/bin/sh

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/home/ueki/catkin_ws/src/interaccion"

# ensure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/home/ueki/catkin_ws/install/lib/python3/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/home/ueki/catkin_ws/install/lib/python3/dist-packages:/home/ueki/catkin_ws/build/lib/python3/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/ueki/catkin_ws/build" \
    "/usr/bin/python3" \
    "/home/ueki/catkin_ws/src/interaccion/setup.py" \
    egg_info --egg-base /home/ueki/catkin_ws/build/interaccion \
    build --build-base "/home/ueki/catkin_ws/build/interaccion" \
    install \
    --root="${DESTDIR-/}" \
    --install-layout=deb --prefix="/home/ueki/catkin_ws/install" --install-scripts="/home/ueki/catkin_ws/install/bin"
