#!/bin/bash
exiting(){
	exit 1
}
trap exiting SIGINT # Ctrl+C
trap exiting SIGQUIT # Terminate
trap exiting SIGTSTP # Ctrl+Z

helptxt(){
	echo -e "\n\tUsage: bash $0 image.jpg\n"
}

if [[ "$1" ]]; then
	convert $1 -strip -trim $1
fi

helptxt
