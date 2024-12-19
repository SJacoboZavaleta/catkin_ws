# Proyecto de Interacción de Usuario en ROS

Este proyecto se centra en el desarrollo de un sistema avanzado de interacción de usuario mediante el uso de ROS (Robot Operating System). El proyecto está estructurado en un espacio de trabajo de Catkin, denominado `CATKIN_ws`, y contiene un paquete principal llamado `interaccion`. Este trabajo forma parte del curso _Sistemas Operativos de Robots_ del Máster en Robótica y Automatización 2024-2025.

## Estructura del trabajo

La estructura del proyecto es la siguiente:

```
catkin_ws/
├── build/
├── devel/
├── src/
│   └── interaccion/
│       ├── config/
│       ├── data/
│       ├── launch/
│       │   └── lanzar_nodos.launch
│       ├── msg/
│       │   ├── inf_personal_usuario.msg
│       │   ├── pos_usuario.msg
│       │   └── usuario.msg
│       ├── nodes/
│       │   └── src/
│       │       ├── dialogo_nodo.py
│       │       ├── emocion_usuario_nodo.py
│       │       ├── empaquetador_nodo.py
│       │       ├── informacion_personal_nodo.py
│       │       ├── matematico_nodo.py
│       │       └── posicion_usuario_nodo.py
│       ├── srv/
│       │   └── Multiplicador.srv
│       ├── CMakeLists.txt
│       ├── package.xml
│       └── setup.py
├── CMakeLists.txt
└── .catkin_workspace
```

### Descripción de los Directorios y Archivos

- **build/** y **devel/**: Directorios generados automáticamente por Catkin durante el proceso de compilación.
- **src/**: Contiene el código fuente del proyecto.
  - **interaccion/**: Paquete principal del proyecto.
    - **config/**: Directorio para archivos de configuración.
    - **data/**: Directorio para datos utilizados por el proyecto.
    - **launch/**: Contiene archivos de lanzamiento para iniciar nodos de ROS.
      - `lanzar_nodos.launch`: Archivo de lanzamiento para iniciar todos los nodos del proyecto.
    - **msg/**: Contiene definiciones de mensajes personalizados de ROS.
      - `inf_personal_usuario.msg`: Mensaje para información personal del usuario.
      - `pos_usuario.msg`: Mensaje para la posición del usuario.
      - `usuario.msg`: Mensaje general del usuario.
    - **nodes/**: Contiene los nodos de ROS (version no implementada).
    - **src/**: Directorio con el código fuente de los nodos.
    - `dialogo_nodo.py`: Nodo para gestionar el diálogo con el usuario.
    - `emocion_usuario_nodo.py`: Nodo para detectar y gestionar las emociones del usuario.
    - `empaquetador_nodo.py`: Nodo para empaquetar datos.
    - `informacion_personal_nodo.py`: Nodo para gestionar la información personal del usuario.
    - `matematico_nodo.py`: Nodo para realizar cálculos matemáticos.
    - `posicion_usuario_nodo.py`: Nodo para gestionar la posición del usuario.
    - **srv/**: Contiene definiciones de servicios personalizados de ROS.
      - `Multiplicador.srv`: Servicio para realizar multiplicaciones.
    - `CMakeLists.txt`: Archivo de configuración de CMake para el paquete.
    - `package.xml`: Archivo de configuración del paquete.
    - `setup.py`: Script de configuración para el paquete.

## Instalación y Uso

1. **Clonar el repositorio**:
   ```bash
   git clone https://github.com/SJacoboZavaleta/catkin_ws.git
   ```

2. **Compilar el proyecto**:
   ```bash
   cd CATKIN_ws
   catkin_make
   ```

3. **Fuente del espacio de trabajo**:
   ```bash
   source devel/setup.bash
   ```

4. **Lanzar los nodos**:
   ```bash
   roslaunch interaccion lanzar_nodos.launch
   ```

## Agradecimiento

A los profesores Sara Carrasco Martinez y Fernando Alonso Martin por las clases practicas de ROS.

## Licencia

Este proyecto está licenciado bajo la Licencia MIT. Consulta el archivo LICENSE para más detalles.
