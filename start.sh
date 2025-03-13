#!/bin/sh

# Check if USERNAME and PASSWORD environment variables are set
if [ -z "$USERNAME" ] || [ -z "$PASSWORD" ]; then
  echo "Error: USERNAME and PASSWORD environment variables must be set."
  exit 1
fi

# Create the password file for HTTP Basic Authentication
htpasswd -bc /etc/nginx/.htpasswd $USERNAME $PASSWORD

# Start Nginx
nginx -g "daemon off;"