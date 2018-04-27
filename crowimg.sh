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
	echo -e "\n\tUsage:"
	echo -e "\tbash $0 image.jpg"
	echo -e "\tbash $0 100 image.jpg"
	echo -e "\tbash $0 image.png\n"
}

firstparam="${1##*.}"
secondparam="${2##*.}"

if [[ $firstparam == *"jpg"* || $firstparam == *"jpeg"* ]]; then
	jpegoptim -stpPSm $1
	exiting
fi

if [[ $firstparam == *"png"* ]]; then
	optipng -preserve -zc 9 -zm 9 -zs 3 $1
	exiting
fi

if [[ $firstparam =~ ^-?[0-9]+$ && ($secondparam == *"jpg"* || $secondparam == *"jpeg"*) ]]; then
	jpegoptim -stpPSm $1 $2
	exiting
fi

helptxt
