#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi


[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

# disable speaker beep
xset -b

# NetworkManager applet
>> /dev/null which nm-applet && nm-applet &

# composition manager
compton -CGb --backend glx --vsync opengl
#compton --config ~/.i3/compton.conf &

# make it easy on the eyes
redshift -O 3200 -l 17:78 -t 4500:3500 -g 0.95:1.0:0.90 &

# notification
dunst -config ~/.i3/dunstrc &

# change caps lock to ESC
xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape' &

# automount devices
udiskie &

# start music server
mpd &

# add font tamsyn
xset fp+ /usr/share/fonts/local
xset +fp /usr/share/fonts/ttf
xset fp rehash

export QT_STYLE_OVERRIDE=GTK+

xsetroot -cursor_name left_ptr &

# exec gnome-session
# exec startkde
# exec startxfce4
# ...or the Window Manager of your choice
exec dbus-launch --exit-with-session i3
