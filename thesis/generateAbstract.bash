#!/bin/bash

sed -n  '/%%ABSTRACT_START%%/,/%%ABSTRACT_END%%/p' $1|sed '/%%ABSTRACT_[^%]\+%%/d' |sed '/^[ \t]*%.*$/d'|sed 's@\\hivEight{}@HIV89.6@g'|sed 's/\$//g'
