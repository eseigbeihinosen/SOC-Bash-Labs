#!/bin/bash

BASELINE="fim-baseline.txt"

create_baseline() {
    TARGET_DIR=$1
    echo "[INFO] Creating baseline for $TARGET_DIR..."

    find "$TARGET_DIR" -type f -exec sha256sum {} \; > $BASELINE

    echo "[INFO] Baseline saved to $BASELINE"
}

check_integrity() {
    TARGET_DIR=$1
    echo "[INFO] Checking integrity of $TARGET_DIR..."

    CURRENT="fim-current.txt"
    find "$TARGET_DIR" -type f -exec sha256sum {} \; > $CURRENT

    # Check for modified files
    while read -r hash file; do
        current_hash=$(grep " $file" $CURRENT | awk '{print $1}')

        if [ -z "$current_hash" ]; then
            echo "[ALERT] FILE DELETED: $file"
        elif [ "$hash" != "$current_hash" ]; then
            echo "[ALERT] FILE MODIFIED: $file"
        fi
    done < $BASELINE

    # Check for new files
    while read -r hash file; do
        if ! grep -q " $file" $BASELINE; then
            echo "[ALERT] NEW FILE DETECTED: $file"
        fi
    done < $CURRENT

    rm $CURRENT

    echo "[INFO] Integrity check completed."
}

case $1 in
baseline)
    create_baseline $2
    ;;
check)
    check_integrity $2
    ;;
*)
    echo "Usage:"
    echo "./fim-monitor.sh baseline /path/to/folder"
    echo "./fim-monitor.sh check /path/to/folder"
    ;;
esac
