Healthcheck.sh

This is a simple Bash script to check your system’s health.
It displays basic system information and logs the results in a file called healthlog.txt.

Features

Shows Date & Time

Displays System Uptime

Shows CPU Load

Displays Memory Usage

Shows Disk Usage

Lists Top 5 memory-consuming processes

Checks nginx and ssh service status

Saves all output to healthlog.txt

How to Run

Open Git Bash or Terminal

Go to the folder where your script is located

cd ~/Desktop/bash-scripting


Give permission to execute

chmod +x Healthcheck.sh


Run the script

./Healthcheck.sh

Output Example
Date & Time: Fri Nov 7 15:45:00 IST 2025
Uptime: 15:45:00 up  2:12,  1 user,  load average: 0.24, 0.18, 0.12
CPU Load: 0.24, 0.18, 0.12
Memory Usage:
              total        used        free
Mem:           7947        1423        4992
Disk Usage:
Filesystem      Size  Used Avail Use% Mounted on
C:/             475G  210G  265G  45% /
Top 5 Memory-Consuming Processes:
USER         PID %CPU %MEM COMMAND
nginx        120   2.3  5.2
sshd         342   1.1  3.2
Service Status:
nginx is NOT running
ssh is NOT running
✅ Health check completed.
