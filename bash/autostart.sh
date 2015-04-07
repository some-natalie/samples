#!/bin/bash
sleep 1
xbacklight -set 100
conky
sleep 1
parcellite &
sleep 1
gnote &
exit
