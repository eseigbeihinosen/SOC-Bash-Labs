# soc-bash-labs

SOC-focused Bash scripts for log analysis, detection, and automation.  
This repository contains simple but practical Bash scripts used in a Security Operations Center (SOC) for detecting suspicious SSH activity from system logs.

---

## 🔍 Scripts Overview

### 1️⃣ Failed SSH Login Detector
**File:** `failed_login_detector.sh`

- Scans authentication logs for **failed SSH login attempts**
- Counts failed attempts per IP address
- Flags IPs that exceed a defined threshold (default: 5 attempts)
- Useful for identifying **SSH brute-force attacks**

---

### 2️⃣ Successful SSH Login Detector
**File:** `successful_login_detector.sh`

- Detects **successful SSH logins**
- Extracts:
  - Username
  - Source IP address
- Useful for:
  - Login auditing
  - Investigating suspicious access

---

### 3️⃣ SSH Login Monitor (SOC Analysis Script)
**File:** `ssh_login_monitor.sh`

- Performs **combined SSH log analysis**
- Detects:
  - 🔴 Multiple failed login attempts (brute-force detection)
  - 🟢 Successful SSH logins (user and source IP)
- Automatically uses a **sample authentication log** for safe testing
- Designed for **SOC analysts and blue-team investigations**

---

## 📂 Sample Log Included for Testing

This repository includes a sample authentication log file:
`log-analysis/sample_auth.log`

The file contains sanitized test data that allows users to run the scripts immediately after cloning the repository.

This avoids requiring access to real system logs such as:
`/var/log/auth.log`

and ensures safe testing without exposing sensitive system data.

Users can replace the sample log with their own authentication logs for real-world analysis.

---

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
./failed_login_detector.sh
./successful_login_detector.sh
./ssh_login_monitor.sh
```

> **Note:** Some scripts may require root privileges to read `/var/log/auth.log`.



