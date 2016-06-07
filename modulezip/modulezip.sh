#!/bin/bash

message(){
  echo " - Zip a python project to work on Amazon Lambda"
  echo " - Usage:"
  echo "     $0 <module_name.py> [library_folder_1 library_folder_2 ...]"
}

if [ $# -eq 0 ]
then
  message $@
else
  modulename=$(basename "$1")
  modulename="${modulename%.*}"

  zip "$modulename".zip "$1"

  shift

  for lib in "$@"
  do
    zip -r "$modulename".zip "$lib"
  done
fi
