space() {
		i=$1
		a=1
		while true; 
			do
		  	if [ $a -le $i ]; 
		  		then
		      	 echo ""
		      else
		      		return 0
		  		fi
		  	a=$((a+1))
			done
}
