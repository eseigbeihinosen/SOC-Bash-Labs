# soc-bash-labs
SOC-focused Bash scripts for log analysis, detection, and automation


## How to Run the Scripts

These Bash scripts are intended to be run on a Linux system
or a Linux environment such as WSL or a virtual machine.

### Steps
```bash
cd soc-bash-labs/log-analysis
chmod +x failed_login_detector.sh
sudo ./failed_login_detector.sh

Note: Access to /var/log/auth.log may require root privileges.
For safe testing, you can modify the script to use a sample log file.
