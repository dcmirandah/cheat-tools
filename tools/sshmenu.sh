#!/bin/bash

# Menu options
echo "Please select a server to connect to:"
echo ""
echo "1 - Connect to wrk1"
echo "2 - Connect to wrk2"
echo ""

USER=${1:-$(whoami)}

# Read user input
read -p "Enter your choice: " option

# Perform action based on user input
case $option in
  1)
    echo "Connecting to wrk1..."
    ssh $USER@192.168.1.40
    ;;
  2)
    echo "Connecting to wrk2..."
    ssh $USER@192.168.1.39
    ;;
  *)
    echo "Invalid option. Please select a valid choice (1-2)."
    ;;
esac
