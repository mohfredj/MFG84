#!/bin/bash -e

VERSION="1.0.0"

OPTS=$(getopt -o vh --long version,help -n $0 -- "$@") 

if [ $? -ne 0 ];then
	echo "failed parsing options"
	exit 1
fi

eval set -- "$OPTS"

show_help()
{
	echo "Usage :"
	echo " $0 [options]"
	echo ""
	echo "-h, --help	show help"
	echo "-v, --version	show script version"
}

show_version()
{
	echo "Version : $VERSION"
}

while true; do
	case "$1" in
		-v|--version)
			show_version
			shift;;

		-h|--help)
			show_help
			shift;;
		--) shift;    break;;
		*) echo " internal error"; exit 1;

	esac 

done
