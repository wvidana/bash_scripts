#!/bin/bash

for var in $@
do
  find . -iname "*$var*" | grep --color=always $var
done
