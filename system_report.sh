#!/bin/bash
# =============================================
# Project: Automated System Report
# Purpose: Collect system info and log it daily
# Author: Your Name
# =============================================

# Set variables for files and thresholds
REPORT_DIR="$HOME/system_reports"        # Directory to store reports
REPORT_FILE="$REPORT_DIR/report_$(date +%Y-%m-%d).txt"  # File name with date
CPU_THRESHOLD=80                        # CPU usage threshold in percent
MEM_THRESHOLD=80                        # Memory usage threshold in percent

# Create report directory if it doesn't exist
mkdir -p "$REPORT_DIR"  # -p creates parent directories if needed

# Start report
echo "System Report - $(date)" > "$REPORT_FILE"  # '>' overwrites or creates file
echo "=====================================" >> "$REPORT_FILE"  # '>>' appends text

# --------------------------
# 1. System Info
# --------------------------
echo "Hostname: $(hostname)" >> "$REPORT_FILE"  # Shows system hostname
echo "Logged in user: $USER" >> "$REPORT_FILE" # Current user
echo "Uptime: $(uptime -p)" >> "$REPORT_FILE"  # System uptime

# --------------------------
# 2. Disk Usage
# --------------------------
echo "Disk Usage:" >> "$REPORT_FILE"
df -h >> "$REPORT_FILE"  # -h = human-readable sizes

# --------------------------
# 3. Top CPU Processes
# --------------------------
echo "Top 5 CPU processes:" >> "$REPORT_FILE"
ps aux --sort=-%cpu | head -n 6 >> "$REPORT_FILE"  
# ps aux = show all processes
# --sort=-%cpu = sort descending by CPU usage
# head -n 6 = top 5 plus header

# --------------------------
# 4. Check CPU & Memory Threshold
# --------------------------
CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')  
# top -bn1 = batch mode, 1 iteration
# grep "Cpu(s)" = get CPU line
# awk '{print $2 + $4}' = user + system CPU usage

MEM=$(free | grep Mem | awk '{print $3/$2 * 100.0}')  
# free = shows memory
# $3/$2 *100 = percentage of used memory

# Check thresholds
if (( $(echo "$CPU > $CPU_THRESHOLD" | bc -l) )); then
    echo "ALERT: High CPU usage - $CPU%" >> "$REPORT_FILE"
fi

if (( $(echo "$MEM > $MEM_THRESHOLD" | bc -l) )); then
    echo "ALERT: High Memory usage - $MEM%" >> "$REPORT_FILE"
fi

# --------------------------
# 5. Final Report
# --------------------------
echo "Report saved to $REPORT_FILE"
