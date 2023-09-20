#!/bin/bash

# Define your project directory path
PROJECT_DIR="/path/to/your/project"

# Define the backup file name with the current date
BACKUP_FILE="project_backup_$(date +'%d_%b_%Y').zip"

# Ask for confirmation before proceeding
read -rp "Do you want to create a backup of the project directory? (yes/YES): " confirmation

# Convert the user input to uppercase for case-insensitive comparison
confirmation=$(echo "$confirmation" | tr '[:lower:]' '[:upper:]')

# Check if the user confirmed the backup
if [ "$confirmation" = "YES" ]; then
  # Create a zip archive of the project directory
  zip -r "$BACKUP_FILE" "$PROJECT_DIR"

  # Check if the zip command was successful
  if [ $? -eq 0 ]; then
    echo "Project directory backup completed successfully. Backup file: $BACKUP_FILE"
  else
    echo "Project directory backup failed."
  fi
else
  echo "Project directory backup aborted."
fi
