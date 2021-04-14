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
	delete_webaap_lib
	delete_space_word
	delete_c_compiler
}
