#!/bin/bash

message(){
  echo " - Easily zip a python module"
  echo " - Usage:"
  echo "     modulezip [module_name.py]"
}

if [ $# -eq 0 ]
then
  message
else
  modulename=$(basename "$1")
  modulename="${modulename%.*}"

  ls *.py | xargs zip "$modulename".zip
fi
