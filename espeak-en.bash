#!/bin/bash
# Name: espeak-en.sh
# Author: Karsten Zarth
# Created: 2020-08-23
# Description: Textselection in GUI is read aloud with english 
#              male voice with espeak-ng and mbrula
#              if already reading: stop
#              if stopped: continue
# Modified: 2020-08-24

status=`ps ax| grep espeak-ng| grep -v grep| awk '{print $3}'`

if [[ $(pgrep -x espeak-ng) ]]
	then
		case $status in
			Tl) killall -s CONT espeak-ng;;
			Sl) killall -s STOP espeak-ng;;
		esac
	else
		xsel | espeak-ng -v mb-us3 -p13 -s135 --punct="-+*/\%=!?:_;(){}[]<>" -x
fi

