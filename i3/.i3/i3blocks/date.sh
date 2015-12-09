#!/bin/bash

activefg='#212121'
activebg='#9bc53d'
inactivebg=''
inactivefg=''
textfg='#ffffff'

val=$(date '+%b %d, %H:%M')

echo -n "<span background=\"$activebg\" foreground=\"$activefg\">  </span>"
echo "<span background =\"$activefg\" foreground=\"$textfg\"> $val</span>"
