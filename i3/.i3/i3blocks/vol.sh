#!/bin/bash
activefg='#212121'
activebg='#9bc53d'
inactivebg=''
inactivefg=''
textfg='#ffffff'

val=$(amixer get Master | grep -E -o '[0-9]{1,3}?%' | head -1 | tr -d '%')
vol=$(awk -F"[][]" '/dB/ { print $6 }' <(amixer sget Master))

if [ $vol == "off" ]; then
    echo -n ""
else 
    if [ $val -lt "50" ]; then
        echo -n "<span background=\"$activebg\" foreground=\"$activefg\">  </span>"
    else
        echo -n "<span background=\"$activebg\" foreground=\"$activefg\">  </span>"
    fi
fi

echo "<span background =\"$activefg\" foreground=\"$textfg\"> $val </span>"
