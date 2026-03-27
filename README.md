# 🖥️ Automated System Report

## Overview
The Automated System Report is a Bash-based script that collects key system information and generates a daily report. It monitors CPU and memory usage, lists top processes, and stores the information in a timestamped log file for easy tracking and review.

---

## Features
Collects system information (hostname, current user, uptime)
Tracks disk usage in human-readable format
Lists top 5 CPU-consuming processes
Monitors CPU and memory usage against defined thresholds
Generates alerts if CPU or memory usage exceeds thresholds
Stores daily reports in a dedicated directory with timestamped filenames

 ---

## Requirements
Linux-based operating system (Ubuntu, Debian, CentOS, etc.)
Bash shell (#!/bin/bash)
Basic Unix utilities: df, ps, top, free, awk, grep, mkdir, echo, bc
bc installed for floating-point arithmetic (sudo apt install bc on Debian/Ubuntu)

---

## Installation and Setup 

### 1. Clone The Repo
```bash
   git clone https://github.com/Ajima-Fabian/system_report.git
```
### 2. make the script executable
```bash
   chmod +x system_report.sh
```
### 3. (Optional) Schedule daily execution with cron

   Add this line to run at 8:00 AM daily
   ```bash
   0 8 * * * /home/username/automated_system_report.sh
```
---

## Usage

### run manually
```baah
./automated_system_report.sh
```
---

# 🧑‍💻 Author

Ajima Fabian

Email: ajimafabian18@gmail.com

GitHub: https://github.com/Ajima-Fabian⁠�


## 📜 License
MIT License. See LICENSE file for details.
