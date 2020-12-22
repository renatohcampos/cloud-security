

# Bootcamp PPT#13
## Session 5.2 Linux Archiving and Logging Data II
**Saturday October 3, 2020** / 6:30-9:30 PM
**Zoom Link:** https://zoom.us/j/2246200754 
**Zoom Password:** 508637

### Introduction

- Today we will be covering `cron` .

- Automation
  - Scripts are files that contain multiple commands.
  - Scheduled jobs run command or scripts at specific, designated times.

- `cron`

  - Script or command designed to run at predefined intervals.
  - Refers to a system daemon that keeps track of when to run scheduled tasks.
  - Tasks are stored and scheduled in a file called `crontab` . 
  - Location: `/etc/crontab`
  - `<Minute> <Hour> <DayOfMonth> <DayOfWeek>`

  - Check status with: `systemctl status cron`
  - List cron jobs: `crontab -l` 
  - Edit cron jobs: `crontab -e`

  - Step intervals with `/n`

- `cron` jobs run under the same permissions as the user who created them.
- Avoid using the **root** `crontab` .
- Excerise Paths:
  - `/tmp/crontab.Y6pyn4/crontab`
  - `/tmp/crontab.9du52u/crontab `
  - `/tmp/crontab.71qz3k/crontab`  
  - `/var/spool/cron/crontabs/sysadmin`

- `crontabs`
  - **user-level** vs **system-level**
- `anachron`
  - Has no daemon, can only be used by root.
  - Periodic task execution program.
  - `ls /etc/cron.daily` , `ls /etc/cron.weekly``
- `lynis`
  - `sudo lynis show commands`
  - `sudo lynis update info`
  - `sudo lynis audit system -Q`
  - `sudo lynis show details <[KEY]>`
  - `sudo lynis audit system --pentest`

