#!/bin/bash

# thanks gpt-4.1 copilot
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/Run_Crackover.command"
COMMAND="0 12 * * * $SCRIPT_DIR yes >/dev/null 2>&1"

read -p "Do you want add $COMMAND to the crontab? (y/n): " ANSWER

# If the user confirms, change the date
if [ "$ANSWER" == "y" ]; then
  (crontab -l; echo "$COMMAND") | crontab -
  echo "Added command to crontab. This will run every day at 12PM."
else
  echo "Change canceled."
fi