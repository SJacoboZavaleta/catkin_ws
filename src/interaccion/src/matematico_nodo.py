#!/usr/bin/env python3

"""
Nodo ROS: matematico_nodo
Autor: Sergio Jacobo-Zavaleta
Fecha: 18/12/24
"""

import rospy
from interaccion.srv import Multiplicador, MultiplicadorResponse

class Matematico_NODO:
    """
    Clase de nodo ROS que proporciona un servicio matemático para multiplicar un entero por 2.
    """

    def __init__(self):
        """
        Inicializa el nodo ROS y configura el servicio.
        """
        # Inicializar el nodo
        rospy.init_node('matematico_nodo')
        rospy.loginfo("El nodo matematico_nodo ha iniciado")

        # Registrar el servicio
        self.service = rospy.Service('servicio_multiplicador', Multiplicador, self.handle_multiplicador)

        rospy.spin()

    def handle_multiplicador(self, req):
        """
        Función de callback del servicio para manejar las solicitudes.

        Parámetros:
            req (MultiplicadorRequest): La solicitud que contiene el entero a multiplicar.

        Retorna:
            MultiplicadorResponse: La respuesta que contiene el resultado multiplicado.
        """
        rospy.loginfo(f"Solicitud recibida para multiplicar: {req.entrada}")
        resultado = req.entrada * 2
        rospy.loginfo(f"Resultado: {resultado}")
        return MultiplicadorResponse(resultado)

if __name__ == '__main__':
    try:
        Matematico_NODO()
    except rospy.ROSInterruptException:
        rospy.loginfo("Ejecución del nodo interrumpida")

