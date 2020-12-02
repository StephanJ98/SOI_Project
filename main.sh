#!/bin/bash

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

# Función CONTAR
function contar {
    read -p 'Introduce el nombre de un nuevo fichero: ' nombre
    test -f $nombre && echo "Ese fichero ya existe." || wc -cwl $* > $nombre
}

# Función RESTO
function resto {
	local arr=($*)
	printf "El resto es: "
	for((i=0;i<${#arr[*]}-1;i++))
		do
			if(( ${arr[i]} == 0 ))
			then
				echo "No puedes dividir entre 0"
			else 
				let resto=${arr[i]}%${arr[i+1]}
				printf "$resto "
			fi
	done
	echo
}

# Función DOBLE
function doble {
	local arr=($*)
	if (( ${arr[0]} <= ${arr[1]} ))
	then
		local menor=${arr[0]}
		local mayor=${arr[1]}
	else
		local menor=${arr[1]}
		local mayor=${arr[0]}
	fi
	for (( index=2; index<=${#arr[*]}-1; index++ ))
	do
		local temp=${arr[$index]/\.*/}
		arr[$index]=$temp
		if (( ${arr[$index]} >= $menor )) && (( ${arr[$index]} <= $mayor ))
		then
			local entre[$index]=$(( ${arr[$index]} * 2 ))
		fi
	done
	echo "El doble de los números que cumplen la condición son:" ${entre[*]}
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
			contar $*
		elif [ $optVar == 'd' ] || [ $optVar == 'D' ]
		then
			doble $*
		elif [ $optVar == 'r' ] || [ $optVar == 'R' ]
		then
			resto $*
		else 
			echo "Opción no valida"
		fi
	done
else
	echo "Error de sintaxis"
fi
