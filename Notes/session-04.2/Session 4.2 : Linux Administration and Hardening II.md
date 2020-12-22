

# Bootcamp PPT#10
## **Session 4.2 **- **Linux Administration and Hardening I**I
**Saturday September 26, 2020** / 6:30-9:30 PM
**Zoom Link:** https://zoom.us/j/2246200754 
**Zoom Password:** 508637

### Introduction 

- Hashes
  - cryptographic function  
  - takes data as input and translates it to random data
  - shadow file for passwords
  - cannot be reversed 

- `john` CLI
  - `--format=`
  - `--show`
- `hashid` CLI
  - `-j`
  - `-m`
- `md5sum` , `sha256` CLIs
  
  - encryption formats
- `sudo`
  - `-lU <group> <user>` *show user privileges*
  - `sudo less <ownedFile>` *gain root access example*
- `gpasswd`
  
- `-d <user> <group>` *delete user from group*
  
- `whoami` , `su` , `visudo`

- `usermod` 

  - `-L` *lock account*
  - `-G` *remove from group*
  - `-aG` *add to group*

- `groups` , `delgroup` , `addgroup`

- `deluser`

  - `--remove-home <user> `

-   `adduser` , 

- `id`

  - `-u <user>` *check UID user*  
  - `-g <user>` *check GID user*

  