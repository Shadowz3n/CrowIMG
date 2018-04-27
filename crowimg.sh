#!/bin/bash
exiting(){ exit 1; }
trap exiting SIGINT # Ctrl+C
trap exiting SIGQUIT # Terminate
trap exiting SIGTSTP # Ctrl+Z
helptxt(){ echo -e "\n\tUsage:\n\tbash $0 image.jpeg\n\tbash $0 image.jpg\n\tbash $0 image.png\n\tbash $0 image.bmp\n"; }
if [[ "$1" ]]; then
	convert $1 -strip -trim -compress jpeg -quality 100 $1
fi
helptxt
