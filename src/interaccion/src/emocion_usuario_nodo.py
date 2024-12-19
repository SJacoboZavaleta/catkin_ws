#!/usr/bin/env python3

"""
ROS Node: emocion_usuario_nodo
Author: Sergio Jacobo-Zavaleta
Date: 18/12/24
"""

import rospy

from std_msgs.msg import String

class Emocion_usuario_NODO:
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
        self._string_publisher = rospy.Publisher(
            "emocion_topic", 
            String, 
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
        #     # Getting user inputs
        #     emocion = input("Emocion: ")

        #     self._custom_publisher.publish(emocion)
        #     rate.sleep()

        while not rospy.is_shutdown():
            # Obtener la emocion
            if self.ready_to_publish:
                while True:
                    emocion = input("Emoción del usuario: ").strip()
                    if emocion:  # Verifica que el nombre no esté vacío
                        break
                    print("La emocion no puede estar vacío. Por favor, ingréselo de nuevo.")

                    # Crear y publicar el mensaje
                    self._string_publisher.publish(emocion)

                    # Deshabilitar hasta recibir confirmación
                    self.ready_to_publish = False
            
            rate.sleep()

   


def main():
    """
    Main function to initialize and run the ROS node.
    """
    try:
        # Node name
        node_name = "emocion_usuario_nodo"
        
        # Initialize the node
        rospy.init_node(node_name)
        rospy.loginfo(f"Node {node_name} has started")
        
        # Create node instance and keep it running
        Emocion_usuario_NODO()
        rospy.spin()
    
    except rospy.ROSInterruptException:
        rospy.loginfo("Node execution interrupted")

if __name__ == "__main__":
    main()