#!/bin/bash

# this script set the doxyfile Version_Number with the defined version in project version header file

usage()
{
        echo "Usage : $0 Version_header_file"
        echo ""
}

DOXYGENE_FILE=Doxyfile
if [ ! -e $DOXYGENE_FILE ] ; then
        echo "Warn: file '$DOXYGENE_FILE' not found in `pwd` ";
        exit 0;
fi

if [ -n "$1" ]; then
        VERSION_HEADER_FILE=$1
	if [ ! -f $VERSION_HEADER_FILE ] ; then
		echo "Warn: file '$VERSION_HEADER_FILE' not found";
	       	exit 0;
        fi
else
	echo 'Warn: missed version_header_file argument'
	usage
	exit 0
fi

MAJOR_VERSION=$(cat $VERSION_HEADER_FILE | awk 'match($0, /_VERSION_MAJOR[ \t]+[0-9]+/) { print substr($0, RSTART+15, RLENGTH-15)}'|xargs)
MINOR_VERSION=$(cat $VERSION_HEADER_FILE | awk 'match($0, /_VERSION_MINOR[ \t]+[0-9]+/) { print substr($0, RSTART+15, RLENGTH-15)}'|xargs)
PATCH_VERSION=$(cat $VERSION_HEADER_FILE | awk 'match($0, /_VERSION_PATCH[ \t]+[0-9]+/) { print substr($0, RSTART+15, RLENGTH-15)}'|xargs)

VERSION_NUMBER=$MAJOR_VERSION.$MINOR_VERSION.$PATCH_VERSION 

sed -i  "s/PROJECT_NUMBER[ \t]*=/PROJECT_NUMBER=\t$VERSION_NUMBER/" $DOXYGENE_FILE

