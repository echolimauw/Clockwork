!#/bin/bash

# This is a tool that automates updates for Debian-based Linux systems.
# Filename: /usr/local/bin/clockworkUpdate.sh

# Timestamp and initialize log file
TIMESTAMP=$(date '+%Y%m%d-%H%M')
LOGFILE="/var/log/clockworkUpdate-${TIMESTAMP}.log"

echo "---------------------------------------------" | tee -a "$LOGFILE"
echo "Starting Clockwork Update: $(date)" | tee -a "$LOGFILE"
echo "---------------------------------------------" | tee -a "$LOGFILE"

echo "Running: sudo apt update" | tee -a "$LOGFILE"
sudo apt update 2>&1 | tee -a "$LOGFILE"

echo "Running: sudo apt upgrade -y" | tee -a "$LOGFILE"
sudo apt upgrade -y 2>&1 | tee -a "$LOGFILE"

echo "Running: sudo apt autoremove -y" | tee -a "$LOGFILE"
sudo apt autoremove -y 2>&1 | tee -a "$LOGFILE"

echo "Script completed. Rebooting system..." | tee -a "$LOGFILE"
sudo reboot
