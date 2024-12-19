#!/usr/bin/env python3
import rospy
from interaccion.msg import usuario

class Dialogo_NODO:
    """
    A ROS node class for subscribing to one topic.
    
    This class demonstrates:
    - Creating a ROS subscriber
    - Subscribing to empaquetador_nodod topic
    """

    def __init__(self):
        """
        Initialize the ROS node and set up publishers.
        
        Sets up:
        - String topic publisher
        - String name, int edad and String[] idiomas from users using 
            a custom message publishers
        """

        rospy.Subscriber('user_topic', 
                         usuario, 
                         self.print_terminal)

        rospy.spin()

    def print_terminal(msg):
        print("\n--- Información del Usuario ---")
        print(f"Nombre: {msg.infPersonal.nombre}")
        print(f"Edad: {msg.infPersonal.edad}")
        print(f"Idiomas: {', '.join(msg.infPersonal.idiomas)}")
        print(f"Emoción: {msg.emocion}")
        print(f"Posición: X={msg.posicion.x}, Y={msg.posicion.y}, Z={msg.posicion.z}")
        print("-------------------------------")
    
def main():
    """
    Main function to initialize and run the ROS node.
    """
    try:
        # Node name
        node_name = "dialogo_nodo"
        
        # Initialize the node
        rospy.init_node(node_name)
        rospy.loginfo(f"Node {node_name} has started")
        
        # Create node instance and keep it running
        Dialogo_NODO()
        rospy.spin()
    
    except rospy.ROSInterruptException:
        rospy.loginfo("Node execution interrupted")

if __name__ == '__main__':
    main()