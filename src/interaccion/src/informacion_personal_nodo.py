#!/usr/bin/env python3

"""
ROS Node: informacion_personal_nodo
Author: Sergio Jacobo-Zavaleta
Date: 18/12/24
"""

import rospy

from interaccion.msg import inf_personal_usuario

class informacion_personal_NODO:
    """
    A ROS node class for publishing a message to one topic.
    
    This class demonstrates:
    - Creating a ROS publisher
    - Publishing a custom message
    """

    def __init__(self):
        """
        Initialize the ROS node and set up publishers.
        
        Sets up:
        - String topic publisher
        - String name, int edad and String[] idiomas from users using 
            a custom message publishers
        """
        # Publisher for personal information messages
        self._custom_publisher = rospy.Publisher(
            "inf_pers_topic", 
            inf_personal_usuario, 
            queue_size=10
        )

        # Small delay to ensure publisher is ready
        #rospy.sleep(1)

        # Run the main logic
        self._run()

    def _run(self):
        """
        Main method to execute node's primary logic.
        
        Calls methods to publish different types of messages.
        """
        rate = rospy.Rate(1)
        self.query_info(rate)

    def query_info(self,rate):
        """
        Publish a custom message to the topic.
        
        Note: Requires custom message type and publisher to be defined.
        """
        # Version simple
        # while not rospy.is_shutdown():
        #     # Getting user inputs
        #     nombre = input("Nombre: ")
        #     edad = int(input("Edad: "))
        #     idiomas = input("Idiomas (separados por comas):").split(",")

        #     msg = inf_personal_usuario()
        #     msg.nombre = nombre
        #     msg.edad = edad
        #     msg.idiomas = idiomas

        #     self._custom_publisher.publish(msg)
        #     rate.sleep()

        while not rospy.is_shutdown():
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
            rate.sleep()

   


def main():
    """
    Main function to initialize and run the ROS node.
    """
    try:
        # Node name
        node_name = "informacion_personal_nodo"
        
        # Initialize the node
        rospy.init_node(node_name)
        rospy.loginfo(f"Node {node_name} has started")
        
        # Create node instance and keep it running
        informacion_personal_NODO()
        rospy.spin()
    
    except rospy.ROSInterruptException:
        rospy.loginfo("Node execution interrupted")

if __name__ == "__main__":
    main()