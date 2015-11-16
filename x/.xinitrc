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

# add font tamsyn
xset fp+ /usr/share/fonts/local
xset +fp /usr/share/fonts/ttf
xset fp rehash

export QT_STYLE_OVERRIDE=GTK+

# exec gnome-session
# exec startkde
# exec startxfce4
# ...or the Window Manager of your choice
exec dbus-launch --exit-with-session i3
