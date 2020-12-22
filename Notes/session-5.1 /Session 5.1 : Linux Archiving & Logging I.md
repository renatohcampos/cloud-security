

# Bootcamp PPT#12
## Session 5.1 Linux Archiving and Logging Data I
**Thursday October 1, 2020** / 6:30-9:30 PM
**Zoom Link:** https://zoom.us/j/2246200754 
**Zoom Password:** 508637

### Backups & Restoring Data with tar

- Archiving Data
  - Ensuring data availability.
  - Overseeing backup and recovery.
  - Determining frequency of backups.
  - Determining data retention time.
- Scheduling Backups
  - Keeping things up to date and patched.
- Monitoring Log Files
- `gzip` and `gunzip` tar compression 

- `tar` *(tape archive)*

  - **archive** vs **compression**
  - `tar cvf fileName.tar <location>`
  - `tar xvf fileName.tar -C <location> --wildcards "*filesToSave*" `
  - `cvf` is multi-option 
  - `c` creating archive 
  - `t` taking a peak
  - `x ` unarchiving
  - `v` verbose prints progress status
  - `vv` very verbose

  - `f` title of archive
  - `-C <location>`  move to location
  - `--wildcard`

- Backups
  - Saved by versions.
  - Hard drive VS every file.
  - Full backup (complete restoration)
  - Incremental backup (changes in data)
  - Differential backup(changes in data)
- Incremental Backup
  - `.snar` 
  - `--listed-incremental=emerg_backup.snar`
  - `--level=0` incremental backup
  - `--incremental`
  - `D` directory
  - `Y` yes ,  `N` no