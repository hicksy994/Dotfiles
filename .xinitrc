#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then







    xrdb -merge $sysresources

fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then







    xrdb -merge "$userresources"

fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

exec setxkbmap gb &
exec mopidy &
exec xrdb .Xresources &
exec xbanish &
exec xset s off &
exec xset -dpms &
exec xset s noblank &
exec feh --bg-scale /home/hicksy/wallpapers/sunset.png &
exec nvidia-settings -l &
exec xrandr --output DVI-D-0 --mode 1920x1080 --rate 144 &
exec compton -f -D 3 &
exec twmnd &

exec i3
