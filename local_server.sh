#!/bin/bash

# Define Django project directory
PROJECT_DIR="/path/to/your/django/project"

# Define Django management script
MANAGE_SCRIPT="manage.py"

# Define the command to start the development server
DEV_SERVER_CMD="sudo python $MANAGE_SCRIPT runserver 0:80"

# Define the command to start the production server using nohup
PROD_SERVER_CMD="sudo nohup python $MANAGE_SCRIPT runserver 0:80 &"

# Define the command to stop the server
STOP_SERVER_CMD="sudo fuser -k 80/tcp"

# Check for the mode (development/production/stop)
if [ "$1" = "development" ]; then
  echo "Starting Django development server..."
  eval "$DEV_SERVER_CMD"
elif [ "$1" = "production" ]; then
  echo "Starting Django production server..."
  eval "$PROD_SERVER_CMD"
elif [ "$1" = "stop" ]; then
  # Ask for confirmation before stopping the server
  read -rp "Are you sure you want to stop the Django server? (yes/YES): " confirmation
  confirmation=$(echo "$confirmation" | tr '[:lower:]' '[:upper:]')
  if [ "$confirmation" = "YES" ]; then
    echo "Stopping Django server..."
    eval "$STOP_SERVER_CMD"
  else
    echo "Server stop aborted."
  fi
else
  echo "Usage: $0 [development|production|stop]"
fi
