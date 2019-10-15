#!/bin/bash 
#Written By Grant McKechnie
#Date 19 Nov 2017
#Purpose - Low tech monitor of squating for domains. 
#Version 1.1

#History 
# 19 nov 2017 - Initial version prototype
# 20 Nov 2017 - added dir creation and adjusted file extensions
# 14 July 2019 - Cleaned up - uploaded to github
# 13 Oct 2019 - altered structure for files for easier analysis
 

# Reference Data
FILE_EXT='date +%F_%T'
DOMAIN_DEFEND_LIST="telstra.net.au bigpond.com.au telstra.net telstra.net.au telstra.com bigpond.com telstra.com.au team.telstra.com"
#DOMAIN_DEFEND_LIST="telstra.net.au bigpond.com.au" 


for DOMAIN in ${DOMAIN_DEFEND_LIST}
do
	if [ ! -d ${HOME}/DOMAIN_DEFEND/${DOMAIN}/${DOMAIN}.`date +%F` ] ;
        	then
        		mkdir -p ${HOME}/DOMAIN_DEFEND/${DOMAIN}
	fi
 
	 ./dnstwist.py -r -g -m -c -s -t 20 -w ${DOMAIN} > ${HOME}/DOMAIN_DEFEND/${DOMAIN}/`date +%F`.${DOMAIN}.csv
done
