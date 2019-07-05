#!/bin/bash

# Config
servername="OTServBR"

# Allow core dumps
ulimit -c unlimited

# Main loop
while true;
do
	date=`date "+%d-%m-%y-%H-%M-%S"`
	filename="${servername}-${date}"
	logfile="${filename}.log"

	# Chamando a configuração do antirollback e registrando o log
	gdb --command=basic_antirollback --args ./tfs | tee data/logs/serverlog/$logfile
	
	if [ $? -eq 0 ]; then
		echo "Exit code 0, aguardando 5 segundos..."	 #Pode ser usado no backup do banco de dados com mysqldump
		sleep 5	#5 segundos
	else
		echo "Crash!! Reiniciando o servidor em 5 segundos (O arquivo de log está guardado na pasta logs)"
		echo "Se quiser encerrar o servidor, pressione CTRL + C..."
		sleep 5							
	fi
done;

