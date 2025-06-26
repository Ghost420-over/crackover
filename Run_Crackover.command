#!/bin/bash

###########################
#      CrackOver 1.0      #
# Made by: Ghost420-over  #
# Made by: BaguetteYeeter #
###########################

PLIST_FILE=$HOME/Library/Preferences/com.codeweavers.CrossOver.plist
PLIST_BACK=$PLIST_FILE.bak
ONE_DAY_AGO=$(date -v-1d +"%m/%d/%y")

# Check if PLIST_FILE exists
if [ ! -f "$PLIST_FILE" ]; then
  echo "Error: $PLIST_FILE not found."
  exit 1
fi

# If the first argument is "yes", skip the prompt
if [ "$1" == "yes" ]; then
  ANSWER="y"
else
  read -p "Do you want change FirstRunDate to $ONE_DAY_AGO in $PLIST_FILE? (y/n): " ANSWER
fi

# If the user confirms, change the date
if [ "$ANSWER" == "y" ]; then
  # Create a backup of the original file
  cp "$PLIST_FILE" "$PLIST_BACK"
  echo "Backup created: $PLIST_BACK"

  #TODO: no idea what the time format should be
  /usr/libexec/PlistBuddy -c "Set :FirstRunDate $ONE_DAY_AGO" "$PLIST_FILE"
  echo "Changed FirstRunDate."
else
  echo "Change canceled."
fi

# For every bottle
for DIR in "$HOME/Library/Application Support/CrossOver/Bottles/"*; do
  echo
  BOTTLE_FILE="$DIR/system.reg"
  BACKUP="$BOTTLE_FILE.bak"
  PATTERN="\[Software\\\\\\\\CodeWeavers\\\\\\\\CrossOver\\\\\\\\cxoffice\] [0-9]*"

  # Check if BOTTLE_FILE exists
  if [ ! -f "$BOTTLE_FILE" ]; then
    echo "Error: $BOTTLE_FILE not found."
    exit 1
  fi

  # Find the line number where the pattern appears
  LINE=$(grep -n "$PATTERN" "$BOTTLE_FILE" | cut -d: -f1)

  # If the pattern is found, print the matching lines and ask for confirmation
  if [ -n "$LINE" ]; then
    echo "Match found at line $LINE in $BOTTLE_FILE."

    # Print the matching lines
    sed -n "${LINE},$(($LINE + 4))p" "$BOTTLE_FILE"

    # If the first argument is "yes", skip the prompt
    if [ "$1" == "yes" ]; then
      ANSWER="y"
    else
      read -p "Do you want to delete these lines in $BOTTLE_FILE? (y/n): " ANSWER
    fi

    # If the user confirms, delete the lines
    if [ "$ANSWER" == "y" ]; then
      # Create a backup of the original file
      cp "$BOTTLE_FILE" "$BACKUP"
      echo "Backup created: $BACKUP"

      awk -v line="$LINE" 'NR >= line && NR <= line + 4 {next} {print}' "$BOTTLE_FILE" > temp && mv temp "$BOTTLE_FILE"
      echo "Lines deleted in $BOTTLE_FILE."
    else
      echo "Deletion canceled for $BOTTLE_FILE."
    fi
  else
    echo "No match found in $BOTTLE_FILE. (lines already deleted?)"
  fi
done
