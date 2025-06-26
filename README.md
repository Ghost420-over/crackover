# Crackover

This tool will reset the crossover trial, and resets it to 14 days. This runs for every bottle. Works up to the most recent version of crossover (25).

Credit goes to [this video](https://www.youtube.com/watch?v=d4Hlm9kJrEo) for how to reset the bottle trial.

### Note: This program is for testing and experimenting only. Please support CodeWeavers as their work is outstanding!!!

## Usage:

1. Close Crossover and all related apps.
2. Open Terminal
3. Drag the `Run_Crackover.command` file into the Terminal, and hit enter.
4. The program then explains the changes it will make. Press `y` to confirm the changes.
5. A backup is created, just in case anything happens. These end in `.bak`
6. Open Crossover, and enjoy!

### NOTE: This needs to be run every two weeks. Either set an alarm for yourself, or set up crontab to do it automatically.

## Install cron:

This cron job runs once a day at 12PM, assuming your Mac is on.

1. Run the script normally (as shown above), just to make sure it works.
2. Open Terminal
3. Drag `create_cron.command` into the terminal, and hit enter.
4. The program explains changes. Press `y` to confirm.
5. Done!

#### Note: Do not delete this project's directory, as the cron job will stop working.