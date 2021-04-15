delete_c_compiler(){
	rm c_compiler.sh
}

delete_space_word(){
	rm space_word.sh
}

delete_webaap_lib(){
	rm en_us.sh
	rm pt_br.sh
}

delete(){
	delete_webaap_lib || clear
	delete_space_word || clear
	delete_c_compiler || clear
	rm delete_shell.sh || clear
}


# Raw https://raw.githubusercontent.com/4ly-a/shellscript_library/master/delete_shell.sh
