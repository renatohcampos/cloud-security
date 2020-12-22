# Bootcamp PPT#23
## Session 8.3 Networking Fundamentals III
**Tuesday October 27, 2020** / 6:30-9:30 PM
**Zoom Link:** https://zoom.us/j/2246200754 
**Zoom Password:** 606132

### Expectations

- Better understanding of Layers 2, 3, 4.
- Understanding ARP activity. 
- Using `ping` and `fping`
- Using `traceroute`
- Understanding TCP and UDP.
- Anakyze TCP traffic with Wireshark.
- Analyze SYN scans.

### Methods

- Enumeration Methods
  - physical addresses 
- Media Access Control
  - physical machine address
- **Layer 2** (Data Link)
  - ARP Request & Reply
  - ARP Cache Timeout
    - dynamic addresses
- **Wireshark**
  - ARP Filter
    - Check Ethernet and ARP details.
    - **Request:** `arp.opcode  == 1`
    - **Reply:** `arp.opcode  == 2`
  - TCP Handshake 
    - True = `1` , False = `0`
    - `tcp.flags.syn == <#>`
    - `tcp.flags.ack == <#>`
- `ping`
  - Packet inter-network groper.
  - Internet Control Message Protocol (IMCP)
  - Count: `-c`
- `fping`
  - Count: `-c`
  - Generate a target list from a supplied IP netmask: `-g`
- `traceroute`
  - Used ICMP and Time to Live (TTL)
  - TTL is an indicator of how long a packet lasts.

### LAN, MAN, WAN

- A **LAN** (local area network) is a group of computers and network devices connected together, usually within the same building. By definition, the connections must be high speed and relatively inexpensive (e.g., token ring or Ethernet). 

- A **MAN** (metropolitan area network) is a larger network that usually spans several buildings in the same city or town.

- A **WAN** (wide area network), in comparison to a MAN, is not restricted to a geographical location, although it might be confined within the bounds of a state or country. A WAN connects several LANs, and may be limited to an enterprise (a corporation or an organization) or accessible to the public. The technology is high speed and relatively expensive. The Internet is an example of a worldwide public WAN.

### What is Transmission Control Protocol (TCP)?

- **TCP works on network layer 4 of the Open Systems Interconnection model**. 

- **TCP handshake:**

  - **Setup:** SYN, SYNACK, ACK, Data

  - **Termination:** FIN, ACK, FIN, ACK

- Connection-oriented protocol that computers use to communicate over the internet. 
- It is one of the main protocols in TCP/IP networks. 
- TCP provides error-checking and guarantees delivery of data and that packets will be delivered in the order they were sent.

### What is User Datagram Protocol (UDP)?

- **UDP works on network layer 4 of the Open Systems Interconnection model**. 

- Connectionless protocol that works just like TCP but assumes that error-checking and recovery services are not required. 
- UDP continuously sends datagrams to the recipient whether they receive them or not.

### What’s the difference?

- TCP and UDP have many differences and similarities. 
- They are the most commonly used protocols for sending packets over the internet. 
- They both work on the transport layer of the TCP/IP protocol stack and both use the IP protocol.

<u>**TCP** is best suited to be used for applications that require **high reliability** where **timing is less of a concern**.</u>

- World Wide Web (HTTP, HTTPS)
- Secure Shell (SSH)
- File Transfer Protocol (FTP)
- Email (SMTP, IMAP/POP)

<u>**UDP** is best suited for applications that require **speed and efficiency**.</u>

- VPN tunneling
- Streaming videos
- Online games
- Live broadcasts
- Domain Name System (DNS)
- Voice over Internet Protocol (VoIP)
- Trivial File Transfer Protocol (TFTP)

### Address Resolution Protocol (ARP)

- Procedure for mapping a dynamic Internet Protocol address to a permanent physical machine address in a local area network. 
- The physical machine address is also known as a Media Access Control.
- The job of the ARP is essentially to translate 32-bit addresses to 48-bit addresses and vice-versa. 
- This is necessary because in IP Version 4 (IPv4), the most common level of Internet Protocol use today, an IP address is 32-bits long, but MAC addresses are 48-bits long.

- **ARP works between network layers 2 and 3 of the Open Systems Interconnection model**. The MAC address exists on layer 2 of the OSI model, the data link layer, while the IP address exists on layer 3, the network layer.

- ARP can also be used for IP over other LAN technologies, such as token ring, fiber distributed data interface (FDDI) and IP over ATM.

- In IPv6, which uses 128-bit addresses, ARP has been replaced by the Neighbor Discovery protocol.

### How ARP works

- When a new computer joins a LAN, it is assigned a unique IP address to use for identification and communication. When an incoming packet destined for a host machine on a particular LAN arrives at a gateway, the gateway asks the ARP program to find a MAC address that matches the IP address. A table called the ARP cache maintains a record of each IP address and its corresponding MAC address.
- All operating systems in an IPv4 Ethenet network keep an ARP cache. Every time a host requests a MAC address in order to send a packet to another host in the LAN, it checks its ARP cache to see if the IP to MAC address translation already exists. If it does, then a new ARP request is unnecessary. If the translation does not already exist, then the request for network addresses is sent and ARP is performed.
- ARP broadcasts a request packet to all the machines on the LAN and asks if any of the machines know they are using that particular IP address. When a machine recognizes the IP address as its own, it sends a reply so ARP can update the cache for future reference and proceed with the communication.
- Host machines that don't know their own IP address can use the Reverse ARP (RARP) protocol for discovery.
- An ARP cache size is limited and is periodically cleansed of all entries to free up space; in fact, addresses tend to stay in the cache for only a few minutes. Frequent updates allow other devices in the network to see when a physical host changes their requested IP address. In the cleaning process, unused entries are deleted as well as any unsuccessful attempts to communicate with computers that are not currently powered on.

### DNS Spoofing

- Domain Name Server (DNS) spoofing (a.k.a. DNS cache poisoning) is an attack in which altered DNS records are used to redirect online traffic to a fraudulent website that resembles its intended destination.

### DNS cache poisoning example

The following example illustrates a DNS cache poisoning attack, in which an attacker (IP 192.168.3.300) intercepts a communication channel between a client (IP 192.168.1.100) and a server computer belonging to the website **estores.com** (IP 192.168.2.200).

In this scenario, a tool (e.g., arpspoof) is used to dupe the client into thinking that the server IP is 192.168.3.300. At the same time, the server is made to think that the client’s IP is also 192.168.3.300.

Such a scenario would proceed as follows:

1. The attacker uses arpspoof to issue the command: arpspoof 192.168.1.100 192.168.2.200. This modifies the MAC addresses in the server’s ARP table, causing it to think that the attacker’s computer belongs to the client.
2. The attacker once again uses arpspoof to issue the command: arpspoof 192.168.2.200 192.168.1.100, which tells the client that the perpetrator’s computer is the server.
3. The attacker issues the Linux command: echo 1> /proc/sys/net/ipv4/ip_forward. As a result, IP packets sent between the client and server are forwarded to the perpetrator’s computer.
4. The host file, 192.168.3.300 estores.com is created on the attacker’s local computer, which maps the website **estores.com** to their local IP.
5. The perpetrator sets up a web server on the local computer’s IP and creates a fake website made to resemble **estores.com**.
6. Finally, a tool (e.g., dnsspoof) is used to direct all DNS requests to the perpetrator’s local host file. The fake website is displayed to users as a result and, only by interacting with the site, malware is installed on their computers.

