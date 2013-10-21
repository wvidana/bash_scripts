#!/bin/sh
echo 'Usage ./tex2html Memoria'
echo $(basename $1 .tex)
cp $(basename $1 .tex).tex index.tex
sed -e 's/\\begin{Sinput}/ { \\color{red} \\begin{verbatim}/
 s/\\end{Sinput}/ \\end{verbatim} }/
 s/\\begin{Soutput}/ { \\color{blue} \\begin{verbatim}/
 s/\\end{Soutput}/ \\end{verbatim} }/
 s/\\begin{Schunk}/ /
 s/\\end{Schunk}/ /
 s/\\hfill/ /
 s/\\smallskip//
 s/\\bigskip//
 s/\\medskip//
 s/\\hrule/\n\\hrule\n\n/
 s/\\vbox//
 s/\\begin{spacing}{.*}/\\begin{spacing}{}/
 s/\\vspace{[^}]*}//' index.tex
latex index
makeglossaries index
bibtex index
latex index
latex index
htlatex index "html,word"
rm -f  index.idv index.lg index.tmp index.4tc index.xref index.4ct index.aux index.dvi index.log index.zip index.tex