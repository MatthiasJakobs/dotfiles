# Statusbar loop
while true; do
   xsetroot -name "$( date +"%F %R" )"
   sleep 1m    # Update time every minute
done &

# Autostart section
export PATH=$PATH:/home/matty/.local/bin
setxkbmap eu &

exec dwm
