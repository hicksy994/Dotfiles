pavu_status=$(pulseaudio-ctl full-status)
pavu_status=($pavu_status)

volume=${pavu_status[0]}
muted=${pavu_status[1]}

if [ "$muted" == "yes" ]; then
  echo '<span foreground="#Cd3f45">Muted</span>'
else
    echo '<span foreground="#FFFFFF"> '$volume%' </span>'
fi
