#!/bin/sh
#
# Riccardo Palombo - https://riccardo.im
# Preparato per la community Patreon: patreon.com/riccardopalombo

# entries="[←] Logout\n[↑] Suspend\n[→] Reboot\n[↓] Shutdown"
# selected=$(echo -e $entries|rofi -dmenu -i -theme power-blue -p  | awk '{print tolower($2)}')

# case $selected in
  # logout)
    # hyprctl dispatch exit exit;;
  # suspend)
    # exec systemctl suspend;;
  # reboot)
    # exec systemctl reboot;;
  # shutdown)
    # exec systemctl poweroff -i;;
# esac

case $(printf "%s\n" "Logout" "Reboot" "Suspend" "Hibernate" "Shutdown" | tofi -c ~/.config/tofi/config_power $@) in
	"Logout")
		hyprctl dispatch exit exit
		;;
	"Hibernate")
		systemctl hibernate
		;;
	"Reboot")
		exec systemctl reboot -i
		;;
	"Suspend")
		hyprlock & disown && systemctl suspend
		;;
	"Shutdown")
		exec systemctl  poweroff -i
		;;
esac
