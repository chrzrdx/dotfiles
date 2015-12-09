#!/bin/bash
activefg='#212121'
activebg='#9bc53d'
inactivebg=''
inactivefg=''
textfg='#ffffff'

$val = $(xtitle -s -e -t -60 | xargs -L 1 -I {} sh -c "echo -e \"{}\" | iconv -c -f utf-8 -t utf-8")

echo -n "<span background=\"$activebg\" foreground=\"$activefg\">  </span>"
echo "<span background =\"$activefg\" foreground=\"$textfg\"> $val </span>"
