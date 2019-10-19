
#Belows makes an automatic backup of the files
autobackup(){
	if [[ -d Autobackup ]]; then
		cp -r, ./Autobackup
	else
		makedir ./Autobackup
	fi
}