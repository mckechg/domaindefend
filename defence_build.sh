#!/bin/bash 
#Written By Grant McKechnie
#Date 19 Nov 2017
#Purpose - Low tech monitor of squating for Telstra domains. 
#Version 1.1

#History 
# 19 nov 2017 - Initial version prototype
# 20 Nov 2017 - added dir creation and adjusted file extensions

# Reference Data
FILE_EXT='date +%F_%T'
DOMAIN_DEFEND_LIST="telstra.net telstra.net.au telstra.com bigpond.com tesltra.com.au telstra.com team.telstra.com "

#create directory structure 

if [ ! -d ${HOME}/DOMAIN_DEFEND/`date +%F` ] ;
	then
	mkdir -p ${HOME}/DOMAIN_DEFEND/`date +%F`
fi 


for DOMAIN in ${DOMAIN_DEFEND_LIST}
do
./dnstwist.py -r -g -m -c -s -w ${DOMAIN} > ${HOME}/DOMAIN_DEFEND/`date +%F`/${DOMAIN}_DEFEND.csv
done
