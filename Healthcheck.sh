#!/bin/bash
# ============================
#  System Health Check Script
# ============================

LOG_FILE="healthlog.txt"
echo "==========================" >> "$LOG_FILE"
echo "System Health Check - $(date)" >> "$LOG_FILE"
echo "==========================" >> "$LOG_FILE"

# . System Date & Time
echo "Date & Time:"
date
echo "Date & Time: $(date)" >> "$LOG_FILE"
echo

#  2. System Uptime
echo " Uptime:"
uptime
echo "Uptime: $(uptime)" >> "$LOG_FILE"
echo

#  3. CPU Load
echo " CPU Load:"
uptime | awk -F'load average:' '{ print $2 }'
echo "CPU Load: $(uptime | awk -F'load average:' '{ print $2 }')" >> "$LOG_FILE"
echo

#  4. Memory Usage
echo " Memory Usage (MB):"
free -m
echo "Memory Usage:" >> "$LOG_FILE"
free -m >> "$LOG_FILE"
echo

#  5. Disk Usage
echo " Disk Usage:"
df -h
echo "Disk Usage:" >> "$LOG_FILE"
df -h >> "$LOG_FILE"
echo

#  6. Top 5 Memory-consuming processes
echo " Top 5 Memory-Consuming Processes:"
ps aux --sort=-%mem | head -n 6
echo "Top 5 Memory-Consuming Processes:" >> "$LOG_FILE"
ps aux --sort=-%mem | head -n 6 >> "$LOG_FILE"
echo

#  7. Service Status Check (Cross-platform)
echo " Service Status Check:"
if [[ "$OSTYPE" == "msys" || "$OSTYPE" == "win32" ]]; then
  echo " Running on Windows (Git Bash) — checking via PowerShell..."
  powershell.exe "Get-Service -Name 'sshd','nginx' | Format-Table -AutoSize" 2>/dev/null
  echo "Windows service check complete." >> "$LOG_FILE"
else
  for service in nginx ssh; do
    if systemctl is-active --quiet "$service"; then
      echo " $service is running"
      echo "$service is running" >> "$LOG_FILE"
    else
      echo " $service is NOT running"
      echo "$service is NOT running" >> "$LOG_FILE"
    fi
  done
fi

echo
echo " Health check completed."
echo " Health check completed." >> "$LOG_FILE"
