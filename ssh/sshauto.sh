#!/bin/bash

# Copyright (C) 2013 by Wilfrido Vidaña Sayegh under the terms of the GNU General Public License
version='v0.2'

DOT='.'

if [ -f ~/.sshauto-var ]
then
  TERMINAL=$(cat ~/.sshauto-var)
else
  TERMINAL='xfce4-terminal'
fi

setvar(){
  touch ~/.sshauto-var
  echo "$1" > ~/.sshauto-var
  echo "default terminal changed to: ""$1"
}

message(){
  echo "  Open multiple ssh+screen terminals (default termianl wfce4-terminal)"
  echo ""
  echo "  Use:	sshauto host1.domain.example host2.domain.example..."
  echo ""
  echo "   -d | --domain)"
  echo "         sshauto -d domain host1 host2 host3..."
  echo "   -s | --server)
      Use the variable DOM_sshauto as default domain
      write 'export DOM_sshauto=domain' without quotes if you want to set this variable
      then execute the script like follows:"
  echo "         sshauto -s host1 host2 host3..."
#  echo "		-sd | --savedomain)
#				Same as --domain but it saves the domain as bash variable DOM_sshauto for further use with --server"
  echo "   -h | --help)
      prints this help"
  echo "   -v | --version)
      prints current version"
  echo "   -t | --terminal)
      change the default terminal, storing the variable in ~/.sshauto-var"
  echo "         sshauto -t example-terminal"
  echo "  NOTE: current terminal ""$TERMINAL"
  echo "  Copyright (C) 2013 by Wilfrido Vidaña Sayegh under the terms of the GNU General Public License v3"
  echo "  Version: ""$version"
  exit

}

all_servers(){
  domain="$1"
  shift
  for var in "$@"
  do
    "$TERMINAL" -x ssh -t root@"$var""$domain" screen -R -D &
    sleep 1
  done
}

if [ $# -eq 0 ]
then
  message;
else
  case "$1" in
    -d|--domain)
	shift
	DOM="$DOT""$1"
	shift
	all_servers "$DOM" "$@"
	;;
    -s|--server)
	if [ -z "$DOM_sshauto" ]
	then
	  echo "error: no existe la variable de entorno DOM_sshauto"
	else
    	  shift
    	  DOM="$DOT""$DOM_sshauto"
    	  all_servers "$DOM" "$@"
	fi
    	;;
      -t|--terminal)
  setvar "$2"
      ;;
#    -sd | --savedomain)
#	shift
#	DOM_sshauto="$1"
#	export DOM_sshauto
#	DOM="$DOT""$1"
#	shift
#	all_servers "$DOM" "$@"
#	;;
    -v|--version)
	echo "Version: ""$version"
	;;
    -h|--help)
	message
	;;
    *)	
	DOM=''
	all_servers "$DOM" "$@"
	;;
  esac
fi
exit
