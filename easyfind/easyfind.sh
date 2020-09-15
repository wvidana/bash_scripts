#!/bin/bash

message(){
  echo " - Find any file easily on your terminal"
  echo " - Usage:"
  echo "     easyfind [match_string1, match_string2 ...]"
}

if [ $# -eq 0 ]
then
  message
else
  if [ -t 1 ]
  then
    # Colorful output for interactive terminals
    for var in $@
    do
      find . -iname "*$var*" | grep --color=always $var
    done
  else
    # No color for pipes and redirects
    for var in $@
    do
      find . -iname "*$var*"
    done
  fi
fi
