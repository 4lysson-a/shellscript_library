#!/bin/bash

REPO_NAME="$1"
CUSTOM_USER="$2"
OUTPUT_FILE_NAME=".name.text"

source ${OUTPUT_FILE_NAME}
USER_NAME=$DEFAULT_NAME

set_name_in_name-sh(){
	echo "DEFAULT_NAME=$2" > ./${OUTPUT_FILE_NAME}
	source ./${OUTPUT_FILE_NAME}
	echo "$2, foi setado com sucesso !"
	echo
	exit
}

help(){
	echo 'Como rodar o programa ?'
	echo 'Este programa serve para clonar repositórios do github' 
	echo 'Via ssh sem precisar copiar o comando todo'
	echo
	echo
	echo './clone -h  -> comandos'
	echo
	echo './clone NOME_DO_REPOSITORIO' 
	echo '	--> Clona o repo usando meu nome do github 4lysson-a'
	echo
	echo './clone NOME_DO_REPO CUSTOM_NOME_DO_USUARIO' 
	echo '	--> clona para outro usuário'
	echo
	echo 'Para setar um usuário padrão use o argumento:'
	echo '	./clone --set-name nome_de_usuario'
}

main(){
	if [ "$1" = "--set-name" ]; then
		set_name_in_name-sh $1 $2
	fi

	if [ "$1" = "-h" ]; then
		help
	else
		if [ -z "$2" ]; then
			echo "Clonando, $1 de $USER_NAME: "
			echo

			git clone git@github.com:${USER_NAME}/${REPO_NAME}.git
		else
			echo "Clonando, $1 de $CUSTOM_USER: "
			echo
			
			git clone git@github.com:${CUSTOM_USER}/${REPO_NAME}.git
		fi
	fi
}

clear
main $1 $2
