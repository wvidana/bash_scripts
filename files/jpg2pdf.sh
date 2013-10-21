#!/bin/sh
echo 'Usage ./jpg2pdf'

for f in *.jpg; do
  convert ./"$f" ./"${f%.jpg}.pdf"
done