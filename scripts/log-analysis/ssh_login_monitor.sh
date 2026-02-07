#!/bin/bash

# SOC SSH Login Monitor
# Detects failed and successful SSH login attempts
#
# MITRE ATT&CK Mapping:
# T1110 - Brute Force
# T1021.004 - SSH Remote Services

LOG_FILE="sample_auth.log"

# Auto-detect real auth log if available
if [[ -f sample_auth.log ]]; then
    LOG_FILE="sample_auth.log"
elif [[ -f sample_auth.log ]]; then
    LOG_FILE="sample_auth.log"
fi

echo "Using log file: $LOG_FILE"
echo "----------------------------------"

# Detect failed SSH logins
echo "🔴 Failed SSH Login Attempts (count > 3):"

FAILED=$(grep "Failed password" "$LOG_FILE")

if [[ -z "$FAILED" ]]; then
    echo "No failed SSH login attempts detected."
else
    echo "$FAILED" \
    | awk '{print $(NF-3)}' \
    | sort \
    | uniq -c \
    | awk '$1 > 3 {print $2 " - " $1 " failed attempts"}'
fi

echo "----------------------------------"

# Detect successful SSH logins
echo "🟢 Successful SSH Logins:"
grep "Accepted password" "$LOG_FILE" \
| awk '{print $1, $2, $3, $9, "from", $11}'

echo ""
echo "SOC analysis complete."
