#!/bin/bash

# https://github.com/tilap/frast.git
FIRSTLINE=`git remote -v | head -1`
USERNAME=`echo $FIRSTLINE | cut -d'/' -f4`
REPONAME=`echo $FIRSTLINE | cut -d'/' -f5 | cut -d'.' -f1`
GHPAGE="http://${USERNAME}.github.io/${REPONAME}"

#echo $USERNAME
#echo $REPONAME
#echo $GHPAGE

cd dist
find . -type f -exec curl -X PURGE ${GHPAGE}/{} \; 