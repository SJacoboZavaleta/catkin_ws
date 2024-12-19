#!/usr/bin/env python3

"""
Nodo ROS: informacion_personal_nodo
Autor: Sergio Jacobo-Zavaleta
Fecha: 18/12/24
"""

import rospy
from std_msgs.msg import String
from interaccion.msg import inf_personal_usuario

class Informacion_personal_NODO:
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
        self._custom_publisher = rospy.Publisher(
            "inf_pers_topic", 
            inf_personal_usuario, 
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

            # Obtener el nombre
            while True:
                nombre = input("Nombre: ").strip()
                if nombre:  # Verifica que el nombre no esté vacío
                    break
                print("El nombre no puede estar vacío. Por favor, ingréselo de nuevo.")

            # Obtener la edad
            while True:
                try:
                    edad_input = input("Edad: ").strip()
                    if edad_input:  # Verifica que no esté vacío
                        edad = int(edad_input)  # Intenta convertir a entero
                        if edad >= 0:  # Verifica que la edad sea positiva
                            break
                        else:
                            print("La edad debe ser un número positivo. Por favor, intente de nuevo.")
                    else:
                        print("La edad no puede estar vacía. Por favor, ingrésela de nuevo.")
                except ValueError:
                    print("La edad debe ser un número válido. Por favor, intente de nuevo.")

            # Obtener los idiomas
            while True:
                idiomas_input = input("Idiomas (separados por comas): ").strip()
                if idiomas_input:  # Verifica que no esté vacío
                    idiomas = [idioma.strip() for idioma in idiomas_input.split(",") if idioma.strip()]
                    if idiomas:  # Verifica que la lista no esté vacía
                        break
                    else:
                        print("Debe ingresar al menos un idioma válido. Por favor, intente de nuevo.")
                else:
                    print("La lista de idiomas no puede estar vacía. Por favor, ingrésela de nuevo.")

            # Crear y publicar el mensaje
            msg = inf_personal_usuario()
            msg.nombre = nombre
            msg.edad = edad
            msg.idiomas = idiomas

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
        node_name = "informacion_personal_nodo"
        
        # Inicializar el nodo
        rospy.init_node(node_name)
        rospy.loginfo(f"El nodo {node_name} ha iniciado")
        
        # Crear instancia del nodo y mantenerlo en ejecución
        Informacion_personal_NODO()
        rospy.spin()
    
    except rospy.ROSInterruptException:
        rospy.loginfo("Ejecución del nodo interrumpida")

if __name__ == "__main__":
    main()
