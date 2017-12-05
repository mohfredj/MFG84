#!/bin/bash -e

VERSION="1.0.0"

OPTS=$(getopt -o vh --long version,help -n $0 -- "$@") 

if [ $? -ne 0 ];then
	echo "failed parsing options"
	exit 1
fi

eval set -- "$OPTS"

while true; do
	case "$1" in
		-v|--version)
			echo version : $VERSION
			shift;;

		-h|--help)
			echo "usage : $0 \n -h --help: display this message\n -v --version : disay the version"
			shift;;
		--) shift;    break;;
		*) echo " internal error"; exit 1;

	esac 

done
