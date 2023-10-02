#!/bin/bash

function ctrl_c(){
	echo -e "\n\n [!] Saliendo... \n"
	exit 1
}

# Ctrl+C
trap ctrl_c SIGINT
# Puertos totales
declare -a ports=( $(seq 1 65535) )
# IP es el primer arg del programa
#ip = $1


function checkPort() {

	#$ip = $1
	#$port = $2


	(exec 3<> /dev/tcp/$1/$2) 2>/dev/null
	if [ $? -eq 0 ]; then
		echo "[+] Host $1 - Port $2 está abierto"
	fi
	
	exec 3<&- # Cerramos descriptores de archivo
	exec 3<&- # Cerramos descriptores de archivo
}


if [ $1 ]; then

	for port in ${ports[@]}; do
		# Lanzamos la función en segundo plano (&)
		checkPort $1 $port & 
	done
else
	echo -e "\n [!] Uso $0 <ip-address> \n"
fi


wait






























