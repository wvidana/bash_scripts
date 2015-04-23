#!/bin/bash

# Copyright (C) 2013 by Wilfrido Vidaña Sayegh under the terms of the GNU General Public License
version='v0.3'

DOT='.'

touch ~/.sshauto-var
if (( 2 != $(wc -l < ~/.sshauto-var) ))
  then
  echo "" >> ~/.sshauto-var
  echo "" >> ~/.sshauto-var
fi

DOM=$(sed -n '1 p' ~/.sshauto-var)
TERMINAL=$(sed -n '2 p' ~/.sshauto-var)

message(){
  echo "  Open multiple ssh+screen terminals (default terminal xfce4-terminal)"
  echo "  The equivalent command would be: terminal -e ssh -t root@host screen -D -R"
  echo ""
  echo "  Use:	sshauto host1 host2..."
  echo ""
  echo "   first use)"
  echo "        no arguments for interactive console to set parameters"
  echo "   -d | --domain)"
  echo "         sshauto -d domain host1 host2 host3..."
  echo "   -h | --help)
      prints this help"
  echo "   -v | --version)
      prints current version"
  echo "  NOTE: current terminal: ""$TERMINAL"
  echo "        current domain: ""$DOM"
  echo "  Copyright (C) 2013 by Wilfrido Vidaña Sayegh under the terms of the GNU General Public License v3"
  echo "  Version: ""$version"

}

all_servers(){
  domain="$1"
  shift
  for var in "$@"
  do
    "$TERMINAL" -e ssh -t root@"$var""$domain" screen -R -D &
    sleep 1
  done
}

if [ $# -eq 0 ]
then
  message
  echo "Write your default domain. Blank line wouldn't overwrite"
  echo -n "> "
  read -r DEFdom
  echo "Now write your default terminal (blank for default if first use)"
  echo -n "> "
  read -r DEFter
  if [ -n "$DEFdom" ]
  then
    sed -i '1 c\'"$DEFdom"'' ~/.sshauto-var
  fi
  if [ -n "$DEFter" ]
  then  
    sed -i '2 c\'"$DEFter"'' ~/.sshauto-var
  fi
else
  if [ -z "$TERMINAL" ]
    then
    TERMINAL="xfce4-terminal"
  fi
  case "$1" in
    -d|--domain)
	shift
	DOM="$DOT""$1"
	shift
	all_servers "$DOM" "$@"
	;;
    -v|--version)
	echo "Version: ""$version"
	;;
    -h|--help)
	message
	;;
    *)	
  if [ -n "$DOM" ]
  then
    DOM="$DOT""$DOM"
    all_servers "$DOM" "$@"
  else
    echo "Error: faltan argumentos predefinidos en ~/.sshauto-var"
    echo "Ejecuta sshauto sin argumentos y rellena el dominio cuando te lo pida"
    exit
  fi
	;;
  esac
fi
exit
