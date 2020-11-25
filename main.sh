#!/bin/bash
# Crear un script con comandos de Linux que admita dos o más argumentos;
# de forma que si no es así debe visualizar el mensaje Error de sintaxis. 
# Una vez comprobado esto, debe presentar el siguiente menú por pantalla y
# programar, mediante funciones, las opciones según se detallan a continuación. 
# Una vez terminada cada opción debe volver a mostrarse el menú y 
# así sucesivamente hasta que escoja la opción “FIN”

if (( $# >= 2 ))
then
	echo "2 o +"
	echo "Parametro 1 ${1}"
	echo "parametro 2 ${2}"
else
	echo "Menos de 2"
fi
