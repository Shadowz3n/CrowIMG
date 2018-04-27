#!/bin/bash
if [ -z jpegoptim ]; then
	sudo apt-get install jpegoptim -y
fi

if [ -z optipng ]; then
	sudo apt-get install optipng -y
fi

