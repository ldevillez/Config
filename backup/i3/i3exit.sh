#!/bin/sh

case "$1" in
    lock)
    revert() {
      rm /tmp/*screen*.png
      xset dpms 0 0 0
    }
    trap revert HUP INT TERM
    xset +dpms dpms 0 0 5
    scrot -d 1 /tmp/locking_screen.png
    convert -blur 0x8 /tmp/locking_screen.png /tmp/screen_blur.png
    convert -composite /tmp/screen_blur.png ~/.config/i3/lock.png -gravity South -geometry -20x1200 /tmp/screen.png
    i3lock -i /tmp/screen.png
    revert
        ;;
    logout)
        i3-msg exit
        ;;
    suspend)
        sudo pm-suspend | i3lock -c 000000
        ;;
    hibernate)
        sudo pm-hibernate
        ;;
    reboot)
        sudo reboot
        ;;
    shutdown)
        sudo shutdown now
        ;;
    *)
        echo "Usage: $0 {lock|logout|suspend|hibernate|reboot|shutdown}"
        exit 2
esac

exit 0
