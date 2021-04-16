verificar_nativefier_en(){
	clear
	echo Checking nativefier ...
	echo "" 
	if [ nativefier == 0 ]

		then
			echo Installing nativefier ..
			echo "" 
			sudo npm install -g nativefier
		else
			echo You already have nativefier installed
			echo ""
			echo ""
			return 0
		fi
}


create_app_en(){
	echo App name;
	read app_name;

	echo ""

	echo Site link
	read site_link;

	echo ""

	echo Insert the icon link
	read icon_link;

	echo ""

	echo Enter the icon link extension
	read icon_ex;

	echo ""

	mkdir ~/Downloads/.WebappIcon;

	echo Downloading the icon...

	wget ${icon_link} -O ~/Downloads/.WebappIcon/${app_name}_icon.${icon_ex}

	echo Initializing nativefier

	nativefier -n "${app_name}" -i ~/Downloads/.WebappIcon/${app_name}_icon.png --inject fix.js --single-instance ${site_link}

	echo Moving to /opt ..

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
	
    cd ~/Documents/Webaap/app/

	delete_icon_en
	
	echo All ready !
	echo Your desktop webaapp is installed

	echo ""

	echo Consult this post if you have any questions
	echo ""

	echo https://blog.usejournal.com/whatsapp-for-linux-703275fed797
	echo ""
	echo ""
}



delete_app_en()
 {
 	clear
 	echo Enter the name of the Webapp you want to delete 
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
 	echo ${app_name} successfully deleted
}

home_en(){
	clear
	echo Welcome to the Webaapp installer 
	echo ""
	echo 1 - Create a new Webaap
	echo 2 - Remove a Wbaapp
	echo 0 - exit
	echo ""
	read opcao
	return opcao
}
