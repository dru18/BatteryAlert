#!/bin/bash 

battery_level=$(acpi -b |cut -d "," -f2| sed 's/%//g') 

echo $battery_level	 #$battery_level=30			 

ac_power=$(acpi -b|grep -c "Charging") 
echo $ac_power		 #1 if charging(plugged in) and 0 if discharging (not plugged in) 

if [[ $ac_power -eq 1 && $battery_level -gt 90 ]] #if charging and battery_level==100 
then
export DISPLAY=:0.0 
notify-send -i "/usr/share/icons/Mint-X/status/scalable/battery-full-charging-symbolic.svg" "Dru, Battery is FFfull." "Level: $battery_level% "; 

espeak "Remove the charger." -s 140 

fi

if [[ $ac_power -eq 0 && $battery_level -lt 30 ]] 
then
export DISPLAY=:0.0 
notify-send -i "/usr/share/icons/Mint-X/status/scalable/battery-low-symbolic.svg" "Dru, Battery is Low." "Level: $battery_level% "; 

espeak "Plugin the charger." -s 140 

fi

