#!/bin/bash  
#echo "Script by dilip V_0.1" |figlet -f mini

echo "#######################################################################"
echo "#Script Name  :Curlscript(β)"                                                           
echo "#Description  :To check whether PURGE & TRACE methods enabled or not" 
echo "#Usage        :./curlscript.sh"                                                              
echo "#Author       :Dilipkumar"                                               
echo "#Email        :pkdk.dilipkumar@gmail.com"                                           
echo "#######################################################################"

# create a directory mkdir Curlscript
# ----------------------------------
# Colors

YELLOW='\033[1;33m'
GREEN='\033[0;32m'
NOCOLOR='\033[0m'
RED='\033[0;31m' 
CYAN='\033[0;36m'
# ----------------------------------
# ----------------------------------
#input 

echo Please enter the Project Name:
read varname
cd /root/Curlscript && mkdir $varname 

touch /root/Curlscript/$varname/$varname.txt | pwd

echo -e "${GREEN}Project created${NOCOLOR}"
#cd /root/Curlscript/$varname | pwd
echo please enter the location of Txt_File:
read target 

#----------------------------------

count=0
while read uri1;

   do echo "=======================================================" |& tee -a /root/Curlscript/$varname/$varname.txt  
  	  echo -e "${YELLOW}TARGET_DOMAIN: $uri1 ${NOCOLOR}" |& tee -a /root/Curlscript/$varname/$varname.txt 
  	  echo "=======================================================" |& tee -a /root/Curlscript/$varname/$varname.txt 
      echo "     " 
      echo -e "${GREEN}------Purge_Starting!!!------${NOCOLOR}" |& tee -a /root/Curlscript/$varname/$varname.txt  
      
      curl -X PURGE "$uri1" |& tee -a /root/Curlscript/$varname/$varname.txt 
      echo "             "
      echo -e "${RED}------Purge_ending!!!--------${NOCOLOR}" |& tee -a /root/Curlscript/$varname/$varname.txt   
      echo "             "|& tee -a /root/Curlscript/$varname/$varname.txt 
      echo -e "${GREEN}------Trace_starting!!!------${NOCOLOR}" |& tee -a /root/Curlscript/$varname/$varname.txt  
      
      curl -X TRACE $uri1 |& tee -a /root/Curlscript/$varname/$varname.txt 

      echo "             "|& tee -a /root/Curlscript/$varname/$varname.txt 
      echo -e "${RED}------Trace_ending!!!--------${NOCOLOR}" |& tee -a /root/Curlscript/$varname/$varname.txt 
   	  echo "             "|& tee -a /root/Curlscript/$varname/$varname.txt 
  
      count=(expr $count + 1)

done < $target 
  
currentDate=`date`
echo -e "${CYAN} File saved @ $currentDate ${NOCOLOR}" |& tee -a /root/Curlscript/$varname/$varname.txt

#----------------------------------
