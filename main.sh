#!/bin/bash
# Crear un script con comandos de Linux que admita dos o más argumentos;
# de forma que si no es así debe visualizar el mensaje Error de sintaxis. 
# Una vez comprobado esto, debe presentar el siguiente menú por pantalla y
# programar, mediante funciones, las opciones según se detallan a continuación. 
# Una vez terminada cada opción debe volver a mostrarse el menú y 
# así sucesivamente hasta que escoja la opción “FIN”

# Función que muestra el menu principal.
function showMenu {
	echo "Menú		[R]Resto"
	echo "		[C]Contar"
	echo "		[D]Doble"
	echo "		[F]Fin"
}

# Función que recupera la opción elegida en el menu.
function getMenuOpt {
	read -p 'Opciones: ' optVar
}

# Función FIN
function fin {
	echo "Fin del programa"
	exit
}

# Main Function

if (( $# >= 2 ))
then
	while [ 1 == 1 ]
	do
		showMenu
		getMenuOpt
		if [ $optVar == 'f' ] || [ $optVar == 'F' ]
		then
			fin
		elif [ $optVar == 'c' ] || [ $optVar == 'C' ]
		then
			echo "Función Contar"
		elif [ $optVar == 'd' ] || [ $optVar == 'D' ]
		then
			echo "Función Doble"
		elif [ $optVar == 'r' ] || [ $optVar == 'R' ]
		then
			echo "Función Resto"
		else 
			echo "Opción no valida"
		fi
	done
else
	echo "Error de sintaxis"
fi
