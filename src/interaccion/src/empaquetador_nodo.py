#!/usr/bin/env python3

"""
Nodo ROS: empaquetador_nodo
Autor: Sergio Jacobo-Zavaleta
Fecha: 18/12/24
"""

import rospy
from interaccion.msg import inf_personal_usuario, pos_usuario, usuario
from std_msgs.msg import String

class Empaquetador_NODO:
    """
    Clase de nodo ROS para suscribirse y luego publicar un mensaje.
    
    Esta clase demuestra:
    - Crear un publicador de ROS y varios suscriptores
    - Publicar un mensaje personalizado
    """

    def __init__(self):
        """
        Inicializa el nodo ROS y configura los publicadores.
        
        Configura:
        - Suscriptores para tópicos de tipo String, inf_personal_usuario y pos_usuario
        - Publicador para el tópico de usuario
        """
        # Suscriptores        
        rospy.Subscriber(
            'inf_pers_topic', 
            inf_personal_usuario, 
            self.callback_info)
        rospy.Subscriber(
            'emocion_topic', 
            String, 
            self.callback_emocion)
        rospy.Subscriber(
            'pos_usuario_topic', 
            pos_usuario, 
            self.callback_posicion)
        
        # Publicador
        self._user_publisher = rospy.Publisher(
            'user_topic', 
            usuario, 
            queue_size=10)

        # Versión: Esperar a publicar el mensaje empaquetado para pedir nuevos datos en los otros nodos
        # ----------
        # self._confirmation_publisher = rospy.Publisher(
        #     "confirm_user_topic", 
        #     String, 
        #     queue_size=10)
        # ----------

        # Variables para almacenar los datos recibidos
        self.inf_personal = None
        self.emocion = None
        self.posicion = None

        # Ejecutar la lógica principal
        # self._run()
    
    def callback_info(self, msg):
        """
        Callback para procesar los datos de información personal.
        """
        self.inf_personal = msg
        self.check_and_publish()

    def callback_emocion(self, msg):
        """
        Callback para procesar la emoción del usuario.
        """
        self.emocion = msg.data
        self.check_and_publish()

    def callback_posicion(self, msg):
        """
        Callback para procesar la posición del usuario.
        """
        self.posicion = msg
        self.check_and_publish()

    def check_and_publish(self):
        """
        Verifica si todos los datos necesarios han sido recibidos y publica el mensaje empaquetado.
        """
        if self.inf_personal and self.emocion and self.posicion:
            msg = usuario()
            msg.infPersonal = self.inf_personal
            msg.emocion = self.emocion
            msg.posicion = self.posicion

            self._user_publisher.publish(msg)
            rospy.loginfo("Datos procesados y publicados.")

            # Versión: Esperar a publicar el mensaje empaquetado para pedir nuevos datos en los otros nodos
            # ----------
            # Publicar confirmación
            # self._confirmation_publisher.publish("Datos procesados")
            # ----------
            
            # Reset para recibir nuevos datos
            self.inf_personal = None
            self.emocion = None
            self.posicion = None
            

    def _run(self):
        """
        Método principal para ejecutar la lógica primaria del nodo.
        
        Llama a los métodos para publicar diferentes tipos de mensajes.
        """
        # Nada que hacer aquí

def main():
    """
    Función principal para inicializar y ejecutar el nodo ROS.
    """
    try:
        # Nombre del nodo
        node_name = "empaquetador_nodo"
        
        # Inicializar el nodo
        rospy.init_node(node_name)
        rospy.loginfo(f"El nodo {node_name} ha iniciado")
        
        # Crear instancia del nodo y mantenerlo en ejecución
        Empaquetador_NODO()
        rospy.spin()
    
    except rospy.ROSInterruptException:
        rospy.loginfo("Ejecución del nodo interrumpida")

if __name__ == "__main__":
    main()
