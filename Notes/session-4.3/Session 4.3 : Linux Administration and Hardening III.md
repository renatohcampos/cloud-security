

# Bootcamp PPT#11
## **Session 4.3 **- **Linux Administration and Hardening I**II
**Tuesday September 29, 2020** / 6:30-9:30 PM
**Zoom Link:** https://zoom.us/j/2246200754 
**Zoom Password:** 508637

### Managing Permissions and Services

- Access Controls and Managing Services
  - Inspect and set permissions.
  - Manage and monitor services.
  - Create and assign users for services.

- Access Controls
- Read (r), Write (w), and Execute
- Discretionary Access Control (DAC)
- Every file has a...
  - owner
  - group
  - other
- `chmod`
  - `u=` user
  - `g=` group
  - `o-` other
  - `+` add, `-` minus
- `chown`
  - example: `sudo chown root:root myFile`
- format
  - `-` = file , `d` = directory
  - `[f][uuu][ggg][ooo] N ` 

- `ln ` 
  - symbolic links
  - hard links
  - `-s <file1> <file2>`

### Managing Services

- Servers
  - computers that offer services
- Services and Security
  - attackers can manipulate services
- `systemd` vs `systemcl` 

- Important Commands
  - `systemd` vs `systemctl` 
  - `systemctl -t service -all ` list all services
  - `systemctl status <daemon>` list status
  - `systemctl stop <daemon>` stop daemon
  - `systemctl enable <daemon>` set autostart
  - `systemctl disable <daemon>` remove autostart

