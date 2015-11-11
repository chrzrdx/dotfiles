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

xset fp+ /usr/share/fonts/local

[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

export QT_STYLE_OVERRIDE=GTK+

# exec gnome-session
# exec startkde
# exec startxfce4
# ...or the Window Manager of your choice
#exec dbus-launch --exit-with-session i3
exec i3
