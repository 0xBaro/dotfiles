#!/bin/bash

# 1. Manda i comandi di pausa in BACKGROUND (&) e silenzia l'output
# In questo modo lo script non aspetta che Spotify risponda per proseguire
/usr/bin/playerctl -p spotify pause > /dev/null 2>&1 &
/usr/bin/playerctl -a pause > /dev/null 2>&1 &

# 2. Lancia IMMEDIATAMENTE hyprlock
# Rimuoviamo il check del pgrep per sicurezza: hyprlock gestisce già 
# le istanze multiple impedendo di aprirne due, ed è più veloce farlo fare a lui
/usr/bin/hyprlock