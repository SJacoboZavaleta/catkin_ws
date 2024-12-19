#!/usr/bin/env python3

"""
Nodo ROS: posicion_usuario_nodo
Autor: Sergio Jacobo-Zavaleta
Fecha: 18/12/24
"""

import rospy
from std_msgs.msg import String
from interaccion.msg import pos_usuario

class Posicion_usuario_NODO:
    """
    Clase de nodo ROS para publicar un mensaje en un tópico.
    
    Esta clase demuestra:
    - Crear un publicador de ROS
    - Publicar un mensaje personalizado
    """

    def __init__(self):
        """
        Inicializa el nodo ROS y configura los publicadores.
        
        Configura:
        - Publicador para el tópico de posición del usuario (pos_usuario_topic)
        """
        # Publicador para mensajes de información de posición del usuario
        self._custom_publisher = rospy.Publisher(
            "pos_usuario_topic", 
            pos_usuario, 
            queue_size=10
        )

        self.ready_to_publish = True

        # Versión: Esperar a publicar el mensaje empaquetado para pedir nuevos datos en los otros nodos
        # ----------
        # rospy.Subscriber(
        #     "confirm_user_topic", 
        #     String, 
        #     self.confirm_callback)
        # ----------

        # Ejecutar la lógica principal
        self._run()

    # Versión: Esperar a publicar el mensaje empaquetado para pedir nuevos datos en los otros nodos
    # ----------
    # def confirm_callback(self, msg):
    #     self.ready_to_publish = True
    # ----------

    def _run(self):
        """
        Método principal para ejecutar la lógica primaria del nodo.
        
        Llama a los métodos para publicar diferentes tipos de mensajes.
        """
        rate = rospy.Rate(0.5)
        self.query_info(rate)

    def query_info(self, rate):
        """
        Publicar un mensaje personalizado en el tópico.
        
        Nota: Requiere que el tipo de mensaje personalizado y el publicador estén definidos.
        """
        while not rospy.is_shutdown():
            # Versión: Esperar a publicar el mensaje empaquetado para pedir nuevos datos en los otros nodos
            # ----------
            # if self.ready_to_publish:
            # ----------
        
            # Validar la posición X
            while True:
                try:
                    x_input = input("Posición X: ").strip()
                    if x_input:  # Verifica que no esté vacío
                        x = int(x_input)  # Intenta convertir a entero
                        break
                    else:
                        print("La posición X no puede estar vacía. Por favor, intente de nuevo.")
                except ValueError:
                    print("La posición X debe ser un número válido. Por favor, intente de nuevo.")

            # Validar la posición Y
            while True:
                try:
                    y_input = input("Posición Y: ").strip()
                    if y_input:  # Verifica que no esté vacío
                        y = int(y_input)  # Intenta convertir a entero
                        break
                    else:
                        print("La posición Y no puede estar vacía. Por favor, intente de nuevo.")
                except ValueError:
                    print("La posición Y debe ser un número válido. Por favor, intente de nuevo.")

            # Validar la posición Z
            while True:
                try:
                    z_input = input("Posición Z: ").strip()
                    if z_input:  # Verifica que no esté vacío
                        z = int(z_input)  # Intenta convertir a entero
                        break
                    else:
                        print("La posición Z no puede estar vacía. Por favor, intente de nuevo.")
                except ValueError:
                    print("La posición Z debe ser un número válido. Por favor, intente de nuevo.")

            # Crear y publicar el mensaje
            msg = pos_usuario()
            msg.x = x
            msg.y = y
            msg.z = z

            # Publicar el mensaje
            self._custom_publisher.publish(msg)

            # Versión: Esperar a publicar el mensaje empaquetado para pedir nuevos datos en los otros nodos
            # ----------
            # Deshabilitar hasta recibir confirmación
            # self.ready_to_publish = False
            # ----------

            rate.sleep()

def main():
    """
    Función principal para inicializar y ejecutar el nodo ROS.
    """
    try:
        # Nombre del nodo
        node_name = "posicion_usuario_nodo"
        
        # Inicializar el nodo
        rospy.init_node(node_name)
        rospy.loginfo(f"El nodo {node_name} ha iniciado")
        
        # Crear instancia del nodo y mantenerlo en ejecución
        Posicion_usuario_NODO()
        rospy.spin()
    
    except rospy.ROSInterruptException:
        rospy.loginfo("Ejecución del nodo interrumpida")

if __name__ == "__main__":
    main()