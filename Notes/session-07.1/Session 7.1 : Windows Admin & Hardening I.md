

# Bootcamp PPT#18
## Session 7.1 Windows Admin & Hardening I
**Thursday October 15, 2020** / 6:30-9:30 PM
**Zoom Link:** https://zoom.us/j/2246200754 
**Zoom Password:** 508637

### Introduction

- Windows Command Prompt
- **wmic** and **Task Manager**
- Manage password policies using **gpedit**
- Scheduling tasks using **Task Scheduler**

### Windows

- SOC Anylist
- System Administrator
- Penetration testing
- Endpoint forensics

### Command Prompt

- `cd` or `chdir` change directories
- options with `/`
- `<PROGRAM> /?` , help for a program
- `dir` , similar to `ls`
- `>` and `|` are similar commands
- `find`
- `mkdir`
- `echo`
- `type nul` , similar to `touch` 
- `call` editor
- `del` delete
- `type` is similar to `cat`
- `%<var>%` is for calling variables
- `doskey <alias>-<command>`
- `doskey /HISTORY` is similar to `history`
- `taskmgr` opens **Task Manager**
- `tasklist` , similar to `top`
- `taskkill /PID <PID>` kills processes
- `notepad` text editor
- `sc /<OPTION>` , service controller
  - `query`
  - `config`

### Windows Management Intrumentation Command

- used for quick system queries and information
- `wmic /<GLOBAL SWITCHES> <ALIAS> <VERBS> /<PROPERTIES>`
- `/APPEND:` global switch example
- `wmic qfe list` searches for patches

### Users and Password Policies

- `net`
  - `user` 
  - `localgroup` 
  - `accounts`

