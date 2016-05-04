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
  for var in $@
  do
    find . -iname "*$var*" | grep --color=always $var
  done
fi
