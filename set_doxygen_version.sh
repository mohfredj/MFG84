#!/bin/bash

DOXYGENE_FILE=$1
VERSION_HEADER_FILE=$2
#TODO: verif both files exists

MAJOR_VERSION=$(cat $VERSION_HEADER_FILE | awk 'match($0, /_VERSION_MAJOR[ \t]+[0-9]+/) { print substr($0, RSTART+15, RLENGTH-15)}'|xargs)
MINOR_VERSION=$(cat $VERSION_HEADER_FILE | awk 'match($0, /_VERSION_MINOR[ \t]+[0-9]+/) { print substr($0, RSTART+15, RLENGTH-15)}'|xargs)
PATCH_VERSION=$(cat $VERSION_HEADER_FILE | awk 'match($0, /_VERSION_PATCH[ \t]+[0-9]+/) { print substr($0, RSTART+15, RLENGTH-15)}'|xargs)

VERSION_NUMBER=$MAJOR_VERSION.$MINOR_VERSION.$PATCH_VERSION 

sed -i  "s/PROJECT_NUMBER[ \t]*=/PROJECT_NUMBER=\t$VERSION_NUMBER/" $DOXYGENE_FILE
