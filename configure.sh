#!/bin/bash - 
#===============================================================================
#
#          FILE: configure.sh
# 
#         USAGE: ./configure.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 28/07/2016 09:09
#      REVISION: 2016-07-28 10:42
#===============================================================================

set -o nounset                              # Treat unset variables as an error

echo "checking dependencies"

progs=(vim)
for i in "${progs[@]}"; do
   echo -n "Checking $i ..."
   command -v $i >/dev/null 2>&1 || { echo >&2 "I require $i but it's not installed.  Aborting."; exit 1; }
   echo "done"
done

#creating pdot.conf where user parameters are stored

if [[ -e pdot.conf ]]; then
   read -e -p "pdot.conf exists. Overwrite? " -i "n" doconf
else
   doconf="y"
fi

case ${doconf:0:1} in
    y|Y )
   confvar=( tauthor tauthorref tcompany tcopyright temail tlicense torganization tdate ttime tyear )
   confdef=( 'YOUR NAME' 'YN' '' '' 'YOUR.NAME@DOMAIN' '' '' '%F' '%H:%M' '')
   for (( i=0; i<${#confvar[@]}; i++ )) ; do
      read -e -p "${confvar[$i]#t}? " -i "${confdef[$i]}" ans
      confdef[$i]=$ans
   done
   for (( i=0; i<${#confvar[@]}; i++ )) ; do
      echo "${confvar[$i]}=\"${confdef[$i]}\"" 

   done > pdot.conf
    ;;
    * )
        echo "not changing pdot.conf"
    ;;
esac

