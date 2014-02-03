#!/bin/sh
echo 'Usage sh massive_file_rename.sh'

ls > /tmp/list ; seq -w `ls | wc -l` | paste /tmp/list - | awk -F\\t '{ print $2, "IMG"$2".jpg"}' | xargs -n2 mv


#List the files and redirect the list to a temporary file /tmp/list
#Write a sequence of numbers, padded with zeros, equal to the number of files to STDOUT
##The file count is gotten by listing the files and piping to the wc (word count) app in "lines" mode
#paste the sequence of numbers from the previous command onto the right side of the list of files from /tmp/list
##Paste sticks two files together as columns separated by a TAB character
##Pipe the output to the next program
#Use a small awk program to reformat these two fields
##Separators specified as tab (\t - the first slash is to escape the second one)
##First field $2, the original file name printed as-is
##Second field $2, the sequence number, printed with an IMG prefix and a .jpeg suffix
##Pipe the output to the next program
#Using xargs, pass the pairs of arguments to the mv (move / rename command)
##-n2 means that it will pass 2 of them at a time

#NB, this presumes that your original file names do not contain spaces.
