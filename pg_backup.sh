#!/bin/bash

# Define your PostgreSQL username, database name, and backup file name
PG_USER="postgres"
DB_NAME="DATABASE_NAME"
BACKUP_FILE="backup_$(date +'%d_%b_%Y').sql"
PASSWORD="PASSWORD HERE"
# Specify the hostname or IP address of your PostgreSQL server
PG_HOST="localhost"

# Ask for confirmation before proceeding
read -rp "Do you want to create a backup of the database? (yes/YES): " confirmation

# Convert the user input to uppercase for case-insensitive comparison
confirmation=$(echo "$confirmation" | tr '[:lower:]' '[:upper:]')

# Check if the user confirmed the backup
if [ "$confirmation" = "YES" ]; then
  # Run the pg_dump command
  PGPASSWORD="$PASSWORD" pg_dump -U "$PG_USER" "$DB_NAME" -h "$PG_HOST" > "$BACKUP_FILE"

  # Check if the pg_dump command was successful
  if [ $? -eq 0 ]; then
    echo "Backup completed successfully. Backup file: $BACKUP_FILE"
  else
    echo "Backup failed."
else
  echo "Backup aborted."
fi
