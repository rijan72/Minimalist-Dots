#!/usr/bin/env bash


rofi_command="rofi -theme /home/eloy/Downloads/sc/powerlayout.rasi"
uptime=$(uptime -p | sed -e 's/up //g')

# Options
shutdown="󰿅"
reboot="󰜉"
lock="󰌾"

# Variable passed to rofi
options="$shutdown\n$reboot\n$lock"

chosen="$(echo -e "$options" | $rofi_command -p "UP - $uptime" -dmenu -selected-row 2)"
case $chosen in
    $shutdown)
        systemctl poweroff
        ;;
    $reboot)
        systemctl reboot
        ;;
    $lock)
        i3lock-fancy 
        ;;
esac

