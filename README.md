# soc-bash-labs

SOC-focused Bash scripts for log analysis, detection, and automation.  
This repository contains simple but practical Bash scripts used in a Security Operations Center (SOC) for detecting suspicious SSH activity from system logs.


## 🔍 Scripts Overview

### 1️⃣ Failed SSH Login Detector
**File:** `failed_login_detector.sh`

- Scans authentication logs for **failed SSH login attempts**
- Counts failed attempts per IP address
- Flags IPs that exceed a defined threshold (default: 5 attempts)
- Useful for identifying **SSH brute-force attacks**


### 2️⃣ Successful SSH Login Detector
**File:** `successful_login_detector.sh`

- Detects **successful SSH logins**
- Extracts:
  - Username
  - Source IP address
- Useful for:
  - Login auditing
  - Investigating suspicious access


## ▶️ How to Run the Scripts

These scripts are designed to run on **Linux systems** such as:
- Kali Linux
- Ubuntu
- Debian
- WSL (Windows Subsystem for Linux)


### Step-by-step

```bash
cd soc-bash-labs/log-analysis
chmod +x *.sh
sudo ./failed_login_detector.sh
sudo ./successful_login_detector.sh
```


> **Note:**  
> Access to `/var/log/auth.log` may require root privileges.  
> For safe testing, you can modify the scripts to use a sample log file instead.


