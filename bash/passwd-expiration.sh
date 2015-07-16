#!/bin/bash

# Script to force password expiration at 45 days and allow a warning at 7 days,
# if password expiration has not already been disabled.

awk -F: 'BEGIN { OFS = ":"; ORS = "\n"} { if ($5 != 99999) $5 = 45; $6 = 7} {print}' /etc/shadow > /etc/shadow2
mv -f /etc/shadow2 /etc/shadow
