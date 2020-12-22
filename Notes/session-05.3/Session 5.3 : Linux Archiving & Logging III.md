

# Bootcamp PPT#14
## Session 5.3 Linux Archiving and Logging Data III
**Tuesday October 6, 2020** / 6:30-9:30 PM
**Zoom Link:** https://zoom.us/j/2246200754 
**Zoom Password:** 508637

### Proper Log Management

- `journalctl` , `logrotate` , `audit` , `splunk`


- logs
  - management
  - pinpoint threats
  - application logs
  - event logs
  - service logs
  - `var/log/auth.log`
  - `var/log/cron.log`

- investigating
- size management
- auditing
- `systemctl`
- `journalctl`
  - `systemd` daemon used for logging system events
  - does not provide reader-friendly display
  - `journald` collects and store log information
  - `journalctl --list-boots`
  - `journalctl _UID=`
  - search with `/` 
- `/etc/systemd`

### Log Size Management

- log files can grow to be unmanageable
- **log rotation**: process of archiving a log
  - schedule creation of new logs files
  - compression of log files
  - executing command prior/after a log 
  - `/etc/logrotate.conf`
  - `logrotate -vf <pathToConfFile>`
- `auditd`
  - kernel level tool
  - `ausearch` , `aureport`

