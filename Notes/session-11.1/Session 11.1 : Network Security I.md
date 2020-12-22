# Bootcamp PPT#29
## Session 11.1 Network Security I
**Thursday November 11, 2020** / 6:30-9:30 PM
**Zoom Link:** https://zoom.us/j/2246200754 
**Zoom Password:** 606132

### Expectations

- Firewalls and Network Security.
- Explain how open ports conrtibute to a machiens attack surface.
- Use firewalls to protect a machine's open ports.
- Develop and implement firewall policies with UFW and `firewalld`.

### Introduction

- **Confidentiality**, **Integrity**, and **Availability**
- A **firewall** is a system designed to prevent unauthorized access to or from a private network
  - Considered the first line of defense.
  - Usually perimeter based.
  - Defense in Depth
    - 5. **Perimeter**
    - 4. **Network**
    - 3. **Host**
    - 2. **Application**
    - 1. **Data**

- **Network Security**
  - *IT Help Desk*
  - *System Administrator* 
  - *Security Operations Center (SOC) Analyst*
  - *Penetration Tester*
- Architecture and Defense
  - **Ports:**
    - Devices must expose open port in order to communicate with other machines.
  - **Firewalls:**
    - Single Host
    - Network Firewall
    - Intercept traffic before it reaches target host or router.
    - Inspect source and destination addres and port, TCP flags and incoming packets.
  - **Firewalls on the OSI**
    - *MAC*
      - Operates on Layer 2.
      - Can potentially secure network.
      - Easily bypassed by MAC spoofing.
    - *Packet Filtering*
      - **Stateless** firewalls are designed to protect networks based on static information such as source **and** destination. 
      - **Stateful** firewalls filter **packets** based on the full context of a given network connection, **stateless** firewalls filter **packets** based on the individual **packets** themselves.
      - Layers 3, 4.
      - Easy to subvert with spoofing.
    - *Circuit-level Gateways*
      - Operates on Layer 5.
      - Verifying TCP handshakes.
      - Looks at headers of packets.
      - Easy to approve or deny traffic.
      - Does not check contents of packets.
    - *Application Gateways*
      - Layers 3, 4, 5, 6, 7.
      - Inspects contents of packets.
      - Inspects authentification.
      - Inspects encryption.
      - Resource intensive.
- **UFW**
  - Uncomplicated Firewall.
  - Provides stateless and stateful packet inspection.
  - Performs logging.
  - Manages port access.

- **Firewalld**
  - Does not require a disruption of services for changing of rules.
  - Zones are used to group rules.
  - Permanent configurations.
  - Zones can be set relative to services instead of specific port numbers.
- **Nmap**
  - `sudo nmap -O -p 80,443 --osscan-guess 192.168.86.224 -v`
  - `sudo nmap -sV 192.168.86.224 -v` 
  - `sudo nmap -A -T4 192.168.86.224 -v`
  - `sudo nmap -sU -F 192.168.86.224 -v` 
  - `sudo nmap -sA 192.168.86.224 -v`
  - `sudo nmap -sS 192.168.86.224 -v`
  - `sudo nmap --script=firewalk --traceroute 192.168.86.224 -v`
