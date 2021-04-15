# del=https://raw.githubusercontent.com/4ly-a/shellscript_library/master/delete_shell.sh

# wget -q ${del}

. ../delete_shell.sh


verificar_nativefier(){
	clear
	echo Verificando nativefier ...
	echo "" 
	if [ nativefier == 0 ]

		then
			echo Instalando nativefier ..
			echo "" 
			sudo npm install -g nativefier
		else
			echo Você já tem o nativefier instalado
			echo ""
			echo ""
			return 0
		fi
}


create_app(){
	echo Nome do app;
	read app_name;

	echo ""

	echo Link do site
	read site_link;

	echo ""

	echo Insira o link do icon
	read icon_link;

	echo ""

	echo Insira a extensão do link do icon
	read icon_ex;

	echo ""

	mkdir ~/Downloads/.WebappIcon;

	echo Fazendo Download do icone .. 

	wget ${icon_link} -O ~/Downloads/.WebappIcon/${app_name}_icon.${icon_ex}

	echo Inicializando nativefier

	nativefier -n "${app_name}" -i ~/Downloads/.WebappIcon/${app_name}_icon.png --inject fix.js --single-instance ${site_link}

	echo Movendo para /opt ..

	mv ${app_name}-linux-x64 ${app_name}
	sudo mv ${app_name} /opt

	echo ""

	cd /opt

	echo ""

	chmod +x ${app_name}

	echo ""

	cd ${app_name}

	echo ""

	touch ${app_name}.desktop

	echo ""

	echo "[Desktop Entry]
	Comment=${app_name} for Linux.
	Exec=/opt/${app_name}/${app_name}
	GenericName=${app_name} for Linux.
	Icon=/opt/${app_name}/resources/app/icon.png
	Name=${app_name}
	Categories=Network
	Type=Application
	StartupWMClass=${app_name}
	Terminal=false
	StartupNotify=true" >> ${app_name}.desktop

	echo ""

	sudo mv ${app_name}.desktop /usr/share/applications

	echo ""

	echo Tudo pronto !
	echo Seu web app desktop esta instalado

	echo ""

	echo Consulte este post caso tenha alguma dúvida
	echo ""

	echo https://blog.usejournal.com/whatsapp-for-linux-703275fed797
	echo ""
	echo ""
}

delete_app()
 {
 	clear
 	echo Digite o nome do Webapp que você deseja deletar 
 	echo ""
 	read app_name;
 	echo ""
 	
 	cd /opt
 	sudo rm -rf ${app_name}
 	cd /usr/share/applications
 	sudo rm ${app_name}.desktop
 	
 	cd ~/Downloads/.WebappIcon/

 	if [ 1 ]
 		then
 			sudo rm ${app_name}_icon.png
 			sudo rm ${app_name}_icon.jpg
 			sudo rm ${app_name}_icon.svg
 		fi


 	echo ""
 	echo ${app_name} deletado com sucesso
 	return 0;
}

home(){
	clear
	echo Bem vindo ao instalador do Webaap 
	echo ""
	echo 1 - Criar um novo Webapp
	echo 2 - Remover um Wbaapp
	echo 0 - Sair
	echo ""
	read opcao
	return opcao
}