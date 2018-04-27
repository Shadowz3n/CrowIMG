#!/bin/bash
if [ -z jpegoptim ]; then
	sudo apt-get install jpegoptim -y
fi

if [ -z optipng ]; then
	sudo apt-get install optipng -y
fi

exiting(){
	exit 1
}
trap exiting SIGINT # Ctrl+C
trap exiting SIGQUIT # Terminate
trap exiting SIGTSTP # Ctrl+Z

helptxt(){
	echo -e "\n\t${BOLD}Usage: bash $0 100 image.jpg${NC}"
	echo -e "\t${BOLD}First param: Image quality${NC}"
	echo -e "\t${BOLD}Second param: Image${NC}\n"
}

if [[ "$2" ]]; then
	imagetype="${2##*.}"
	if [ imagetype -eq "jpg" ]; then
		jpegoptim -stpPSm $1 $2
	fi

	if [ imagetype -eq "png" ]; then
		optipng -o 7 $2
	fi
else
	helptxt
fi
