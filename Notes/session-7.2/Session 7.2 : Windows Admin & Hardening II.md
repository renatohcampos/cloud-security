

# Bootcamp PPT#19
## Session 7.2 Windows Admin & Hardening II
**Saturday October 17, 2020** / 6:30-9:30 PM
**Zoom Link:** https://zoom.us/j/2246200754 
**Zoom Password:** 606132

### Introduction

- **Hardening** has 3 aspects.
  - **Network**
  - User
  - **Kernel**

- Powershell cmdlets.
- Piping and scripting.
- **Task Scheduler**.

### Powershell

- Can manage and audit logs.
- Should be restricted to admins.

- Objects (anything PS can interact with)
- Commands
  - `Set-Location` - `cd`
  - `Get-ChildItem` - `ls` , `dir`
    - `gci -recurse -filter <thingToLookFor>`
  - `New-Item` - `mkdir` , `touch`
  - `Remove-Item` - `rm` , `rmdir`
  - `Get-Location` - `pwd`
  - `Get-Content` - `cat` , `type`
  - `Copy-Item` - `cp`
  - `Move-Item` - `mv`
  - `Write-Output` - `echo`
  - `Get-Alias` - `alias`
  - `Get-Help` - `man`
  - `Get-Process` - `ps`
  - `Stop-Process` - `kill`
  - `Get-Service` - `service --status-all`
  - `Get-WinEvent -ListLog`

