delete_c_compiler(){
	rm c_compiler.sh
}

delete_space_word(){
	rm space_word.sh
}

delete_webaap_lib(){
	rm en_us.sh
	rm pt_br.sh
	sudo rm -R .WebappIcon
}

delete(){
	delete_webaap_lib || delete_space_word || delete_c_compiler || rm delete_shell.sh 
}



# Raw https://raw.githubusercontent.com/4ly-a/shellscript_library/master/delete_shell.sh
