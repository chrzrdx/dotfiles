#!/bin/bash
activefg='#212121'
activebg='#9bc53d'
inactivebg=''
inactivefg=''
textfg='#ffffff'

load="$(cut -d ' ' -f1 /proc/loadavg)"
cpus="$(nproc)"

# color if load is too high
if [ $(echo " $load > $cpus" | bc) -eq 1 ]; then
    textfg='#000000'
    activebg='#ff0000'
fi

echo -n "<span background=\"$activebg\" foreground=\"$activefg\">  </span>"
echo "<span background =\"$activefg\" foreground=\"$textfg\"> $load </span>"
