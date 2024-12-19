#!/usr/bin/env python3

"""
ROS Node: posicion_usuario_nodo
Author: Sergio Jacobo-Zavaleta
Date: 18/12/24
"""
import rospy
from std_msgs.msg import String
from interaccion.msg import pos_usuario


class Posicion_usuario_NODO:
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
            "pos_usuario_topic", 
            pos_usuario, 
            queue_size=10
        )

        self.ready_to_publish = True
        rospy.Subscriber(
            "confirm_user_topic", 
            String, 
            self.confirm_callback)
        
        # Small delay to ensure publisher is ready
        #rospy.sleep(1)

        # Run the main logic
        self._run()

    def confirm_callback(self, msg):
        self.ready_to_publish = True
    
    def _run(self):
        """
        Main method to execute node's primary logic.
        
        Calls methods to publish different types of messages.
        """
        rate = rospy.Rate(0.5)
        self.query_info(rate)

    def query_info(self,rate):
        """
        Publish a custom message to the topic.
        
        Note: Requires custom message type and publisher to be defined.
        """
        # Version simple
        # while not rospy.is_shutdown():
            # x = int(input("Posición X: "))
            # y = int(input("Posición Y: "))
            # z = int(input("Posición Z: "))

            # msg = pos_usuario()
            # msg.x = x
            # msg.y = y
            # msg.z = z

        while not rospy.is_shutdown():
            if self.ready_to_publish:
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

                # Crear y publicar el mensaje
                self._custom_publisher.publish(msg)

                # Deshabilitar hasta recibir confirmación
                self.ready_to_publish = False
            
            rate.sleep()


def main():
    """
    Main function to initialize and run the ROS node.
    """
    try:
        # Node name
        node_name = "posicion_usuario_nodo"
        
        # Initialize the node
        rospy.init_node(node_name)
        rospy.loginfo(f"Node {node_name} has started")
        
        # Create node instance and keep it running
        Posicion_usuario_NODO()
        rospy.spin()
    
    except rospy.ROSInterruptException:
        rospy.loginfo("Node execution interrupted")

if __name__ == "__main__":
    main()