#!/bin/sh
echo 'Usage sh multiple_search_and_replace.sh word_to_be_replaced new_word'
grep -rl '$1' ./ | xargs sed -i 's/$1/$2/g'
