#!/bin/bash

# Automated Server Toolkit
# Usage: ./toolkit.sh [flag]

case "$1" in
    --monitor)
        echo "Running System Monitor..."
        echo "--- System Status ---"
        
        # Get CPU usage
        echo "CPU Load:"
        top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4 "%"}'

        # Get Memory usage
        echo "Memory Usage:"
        free -m | awk 'NR==2{printf "%.2f%%", $3*100/$2 }'
        echo ""
        
        # Threshold Example: Alert if Memory > 80%
        mem_usage=$(free | grep Mem | awk '{print $3/$2 * 100.0}')
        if (( $(echo "$mem_usage > 80.0" | bc -l) )); then
            echo "WARNING: High Memory usage detected: ${mem_usage}%"
        fi
        ;;
    --backup)
        echo "Running Backup..."
        
        # Target folder to back up and destination folder for archives
        # Using $HOME ensures it points to your user's home directory safely
        SOURCE_DIR="$HOME/my_folder_to_backup"
        BACKUP_DIR="$HOME/backups"
        
        # Create a test folder and file if it doesn't exist yet so the backup works immediately
        if [ ! -d "$SOURCE_DIR" ]; then
            mkdir -p "$SOURCE_DIR"
            echo "This is a test file for my backup." > "$SOURCE_DIR/test_file.txt"
        fi
        
        # Create a timestamp (e.g., 2026-10-24_22-45-00)
        TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
        BACKUP_NAME="backup_$TIMESTAMP.tar.gz"
        
        # Create backup destination directory if it doesn't exist
        mkdir -p "$BACKUP_DIR"
        
        # Compress the directory
        echo "Compressing $SOURCE_DIR..."
        tar -czf "$BACKUP_DIR/$BACKUP_NAME" -C "$(dirname "$SOURCE_DIR")" "$(basename "$SOURCE_DIR")"
        
        # Check if the backup was successful
        if [ $? -eq 0 ]; then
            echo "SUCCESS: Backup created at $BACKUP_DIR/$BACKUP_NAME"
        else
            echo "ERROR: Backup failed."
            exit 1
        fi
        ;;
    *)
        echo "Usage: ./toolkit.sh {--monitor|--backup}"
        exit 1
        ;;
esac
