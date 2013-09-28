#!/bin/bash -xv

#Checking if the user has passed any argument by the user 
# $# variable outputs the total no of arguments given by the user 
(($#)) || { echo -e "Please check your argument \nUsage ./zipo [-x | -c ] <zip-file-name>" >&2; exit 1;}

if [ -f $1 ]; then

#case in bash 
case $1 in 
            *.tar.bz2)
                tar xjf $1
            ;;
            *.tar.gz)
                tar xzf $1
            ;;
            *.bz2)
                bunzip2 $1
            ;;
            *.rar)
                rar x $1
            ;;
            *.gz)
                gunzip $1
            ;;
            *.tar)
                tar xf $1
            ;;
            *.tbz2)
                tar xjf $1
            ;;
            *.tgz)
                tar xzf $1
            ;;
            *.zip)
                unzip $1
            ;;
            *.Z)
                uncompress $1
            ;;
            *.7z)
                7z x $1
            ;;
            *)
                echo "'$1' cannot be extracted via superzip()"
            ;;
            
        esac;
    else
        echo "I can't help you with this format";
    fi
