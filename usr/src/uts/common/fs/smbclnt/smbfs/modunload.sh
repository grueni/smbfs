#!/bin/sh

MODULEID=`modinfo | awk '/smbfs/{ print $1 }'` 
if [ $MODULEID ];then
    modunload -i $MODULEID
fi