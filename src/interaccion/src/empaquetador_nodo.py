#!/usr/bin/env python3

"""
ROS Node: empaquetador_nodo
Author: Sergio Jacobo-Zavaleta
Date: 18/12/24
"""
import rospy
from interaccion.msg import inf_personal_usuario, pos_usuario, usuario
from std_msgs.msg import String

class Empaquetador_NODO:
    """
    A ROS node class for subscribing and then publishing a message.
    
    This class demonstrates:
    - Creating a ROS publisher and several subscribers
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

        self._confirmation_publisher = rospy.Publisher(
            "confirm_user_topic", 
            String, 
            queue_size=10)


        # Variables
        self.inf_personal = None
        self.emocion = None
        self.posicion = None

        # Small delay to ensure publisher is ready
        #rospy.sleep(1)

        # Run the main logic
        # self._run()
    
    def callback_info(self, msg):
        self.inf_personal = msg
        self.check_and_publish()

    def callback_emocion(self, msg):
        self.emocion = msg.data
        self.check_and_publish()

    def callback_posicion(self, msg):
        self.posicion = msg
        self.check_and_publish()

    def check_and_publish(self):
        if self.inf_personal and self.emocion and self.posicion:
            msg = usuario()
            msg.infPersonal = self.inf_personal
            msg.emocion = self.emocion
            msg.posicion = self.posicion

            self._user_publisher.publish(msg)
            rospy.loginfo("Datos procesados y publicados.")

            # Publicar confirmación
            self._confirmation_publisher.publish("Datos procesados")

            # Reset para recibir nuevos datos
            self.inf_personal = None
            self.emocion = None
            self.posicion = None
    
    def _run(self):
        """
        Main method to execute node's primary logic.
        
        Calls methods to publish different types of messages.
        """
        # nada que hacer aqui

def main():
    """
    Main function to initialize and run the ROS node.
    """
    try:
        # Node name
        node_name = "empaquetador_nodo"
        
        # Initialize the node
        rospy.init_node(node_name)
        rospy.loginfo(f"Node {node_name} has started")
        
        # Create node instance and keep it running
        Empaquetador_NODO()
        rospy.spin()
    
    except rospy.ROSInterruptException:
        rospy.loginfo("Node execution interrupted")

if __name__ == "__main__":
    main()