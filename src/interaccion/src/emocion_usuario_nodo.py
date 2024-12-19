#!/usr/bin/env python3

"""
Nodo ROS: emocion_usuario_nodo
Autor: Sergio Jacobo-Zavaleta
Fecha: 18/12/24
"""

import rospy
from std_msgs.msg import String

class Emocion_usuario_NODO:
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
        - Publicador para el tópico de tipo String
        - Publicadores de mensajes personalizados con información del usuario
          (nombre, edad, idiomas)
        """
        # Publicador para mensajes de información personal
        self._string_publisher = rospy.Publisher(
            "emocion_topic", 
            String, 
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
        
        Nota: Requiere que el tipo de mensaje personalizado y el publicador
              estén definidos.
        """
        while not rospy.is_shutdown():
            # Obtener la emoción

            # Versión: Esperar a publicar el mensaje empaquetado para pedir nuevos datos en los otros nodos
            # ----------
            # if self.ready_to_publish:
            # ----------
            while True:
                emocion = input("Emoción del usuario: ").strip()
                if emocion:  # Verifica que la emoción no esté vacía
                    break
                print("La emoción no puede estar vacía. Por favor, ingrésela de nuevo.")

            # Crear y publicar el mensaje
            self._string_publisher.publish(emocion)

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
        node_name = "emocion_usuario_nodo"
        
        # Inicializar el nodo
        rospy.init_node(node_name)
        rospy.loginfo(f"El nodo {node_name} ha iniciado")
        
        # Crear instancia del nodo y mantenerlo en ejecución
        Emocion_usuario_NODO()
        rospy.spin()
    
    except rospy.ROSInterruptException:
        rospy.loginfo("Ejecución del nodo interrumpida")

if __name__ == "__main__":
    main()
