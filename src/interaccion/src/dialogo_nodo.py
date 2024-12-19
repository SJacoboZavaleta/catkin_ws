#!/usr/bin/env python3

"""
Nodo ROS: dialogo_nodo
Autor: Sergio Jacobo-Zavaleta
Fecha: 18/12/24
"""

import rospy
from interaccion.msg import usuario
from interaccion.srv import Multiplicador

class Dialogo_NODO:
    """
    Clase de nodo ROS para suscribirse a un tópico.
    
    Esta clase demuestra:
    - Crear un suscriptor de ROS
    - Suscribirse al tópico 'user_topic'
    """

    def __init__(self):
        """
        Inicializa el nodo ROS y configura los suscriptores.
        
        Configura:
        - Servicio de multiplicador
        - Suscriptor al tópico de usuario
        """

        # Esperar a que el servicio 'multiplicador' esté disponible
        rospy.loginfo("Esperando a que el servicio 'servicio_multiplicador' esté disponible...")
        rospy.wait_for_service('servicio_multiplicador')
        self.multiplicador_service = rospy.ServiceProxy(
            'servicio_multiplicador', 
            Multiplicador)
        rospy.loginfo("El servicio 'servicio_multiplicador' ya está disponible")

        self.subscriber = rospy.Subscriber(
            'user_topic', 
            usuario, 
            self.process_user_data)
        
    def process_user_data(self, msg):
        """
        Función de callback para procesar los datos del usuario y llamar al servicio 'multiplicador'.
        """
        try:
            # Imprimir datos del usuario
            print("\n--- Información del Usuario ---")
            print(f"Nombre: {msg.infPersonal.nombre}")
            print(f"Edad: {msg.infPersonal.edad}")
            print(f"Idiomas: {', '.join(msg.infPersonal.idiomas)}")
            print(f"Emoción: {msg.emocion}")
            print(f"Posición: X={msg.posicion.x}, Y={msg.posicion.y}, Z={msg.posicion.z}")

            # Llamar al servicio 'multiplicador'
            edad_doblada = self.multiplicador_service(msg.infPersonal.edad)
            print(f"Edad Doblada: {edad_doblada.resultado}")
            print("-------------------------------")

        except rospy.ServiceException as e:
            rospy.logerr(f"La llamada al servicio falló: {e}")
    
def main():
    """
    Función principal para inicializar y ejecutar el nodo ROS.
    """
    try:
        # Nombre del nodo
        node_name = "dialogo_nodo"
        
        # Inicializar el nodo
        rospy.init_node(node_name)
        rospy.loginfo(f"El nodo {node_name} ha iniciado")
        
        # Crear instancia del nodo y mantenerlo en ejecución
        Dialogo_NODO()
        rospy.spin()
    
    except rospy.ROSInterruptException:
        rospy.loginfo("Ejecución del nodo interrumpida")

if __name__ == '__main__':
    main()