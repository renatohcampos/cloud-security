

# Bootcamp PPT#10
## **Session 4.1** **-** **Linux Administration and Hardening I**
**Thursday September 24, 2020** / 6:30-9:30 PM
**Zoom Link:** https://zoom.us/j/2246200754 
**Zoom Password:** 508637

### Introduction 

- **Linux**, Unix (FOSS or *Free Open Source Software*)
  - debian
  - ubuntu 
  - kali
  - fedora
  - centos
- SELinux *(NSA Developed)*
- **LTS** *Long Term Support* 

- **Operating System**
  - basic functions
  - scheduling
  - tasks
  - executing applications
  - controlling peripherals

- command line (headless)
- **linux desktop environments**
  - unity
  - gnome
  - mate
  - kde
  - xfce
  - lxde

### Administration

- File Structure

  - Applications stored in `/usr/bin`
  - use Bash shell by default

- Important Locations

  - `/` root folder
  - `/home` personal files
  - `/etc` configuration files
  - `/bin` , `/sbin` program files
  - `/var` files that change over time
  - `/tmp` tempory files
  - `/media` , `mnt` media/mount locations
  - `/etc/shadow` passwords
  - `/etc/hosts` local dns
  - `/proc` , `/boot` processes and boot files

- boot process 

  - *power on self test* **post**
  - *basic input output system* **bios** (Windows)
  - *unified extensible firmware interface* **UEFI** (Linux)

  - *grand unified bootloader* **grub** (Linux)
  - **boot order** (master boot record)

- *central processing unit* **CPU**

  - brain of the system

### Managing Processes

- **processes**
  - `top` , `ps` , `kill`  
  - `pstree`,`pidof`
  - consuming resources
  - **CPU** and **RAM**
  - makes data active
  - **RAM** vs **Disk Space**

### Packages

- Aptitude Package Manager