#!/bin/sh

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

# add font tamsyn
xset fp+ /usr/share/fonts/local
xset +fp /usr/share/fonts/ttf
xset fp rehash

eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

# disable speaker beep
xset -b

# notification
dunst -config ~/.config/i3/dunstrc &

# # NetworkManager applet
# >> /dev/null which nm-applet && nm-applet &

# composition manager
# compton -CGb --backend glx --vsync opengl
compton -CGb --backend glx --vsync opengl --config ~/.config/i3/comptonrc

# make it easy on the eyes
redshift -O 3200 -l 17:78 -t 4500:3500 -g 0.95:1.0:0.90 &

# change caps lock to ESC
xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape' &

# start music server
#mpd &

# clipboard
# xsel &
xfce4-clipman &

# urxvt daemon
# urxvtd -q -o -f &

alsactl init

export QT_STYLE_OVERRIDE=GTK+

# startxfce4
exec i3
