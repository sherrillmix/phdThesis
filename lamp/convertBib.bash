#!/bin/bash

ii=1
sed 's/\[\([0-9,]\+\)\]/\\citep{\1}/g' lamp.tex >tmp
while read line;do 
	echo $ii: $line
	sed -i "s/\(citep{\)\([A-Za-z0-9,]\+,\)*$ii\([,}]\)/\1\2$line\3/g" tmp
	ii=$((ii+1))
done <bib
