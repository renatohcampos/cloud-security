Renato Campos

November 24, 2020

Cybersecurity HW#11

## Unit 11 Submission File: Network Security Homework 

### Part 1: Review Questions 

#### Security Control Types

The concept of defense in depth can be broken down into three different security control types. Identify the security control type of each set of defense tactics.

1. Walls, bollards, fences, guard dogs, cameras, and lighting are what type of security control?

    **Answer:** These are examples of **physical controls**. These are physical, tangible obstructions to restrict access to systems and assets.

2. Security awareness programs, BYOD policies, and ethical hiring practices are what type of security control?

    **Answer:** These are examples of **administrative controls**. These are policies and procedures that define behavioral practices that are in meet the needs of an organization's security goals. 

3. Encryption, biometric fingerprint readers, firewalls, endpoint security, and intrusion detection systems are what type of security control?

    **Answer:** These are examples of **technical controls**. There are the functions and systems within hardware and software that are use to protect digital organizational assets. This includes the mechanisms for **confidentiality**, **integrity**, and **authentication**. 

#### Intrusion Detection and Attack indicators

1. What's the difference between an IDS and an IPS?

    **Answer:** While both an IDS and IPS read packets and listen to network traffic, an IDS is generally used for detection and monitoring (although making no direct interaction with packets), whereas an IPS is a control system that can accept or reject a packet based on a previously created ruleset.

2. What's the difference between an Indicator of Attack and an Indicator of Compromise?

   **Answer:** An Indicator of Attack (IoA) is evidence that the security of an asset has been breached whereas an Indicator of Compromise (IoC) stipulates the particular intent of what a threat actor was hoping to accomplish.

#### The Cyber Kill Chain

Name each of the seven stages for the Cyber Kill chain and provide a brief example of each.

1. Stage 1: **Reconaissance** 
   - Port scanning, credential harvesting through MITM.
2. Stage 2: **Weaponization**
   - Creating a user that is obfuscated as a service on a machine with root privileges.
3. Stage 3: **Delivery** 
   - Bundling malware within an email attachment.
4. Stage 4: **Exploitation** 
   - Using an unpatched vulenrability within an application.
5. Stage 5: **Installation** 
   - Installation of malware.
6. Stage 6: **Command & Control** 
   - A threat actor uses a C2 server to remotely change the permissions of users on a machine.
7. Stage 7: **Actions on Objectives** 
   - Using a honeypot to observe and determine what the goal of a threat actor was by analysis of protocols used.


#### Snort Rule Analysis

Use the Snort rule to answer the following questions:

Snort Rule #1

```bash
alert tcp $EXTERNAL_NET any -> $HOME_NET 5800:5820 (msg:"ET SCAN Potential VNC Scan 5800-5820"; flags:S,12; threshold: type both, track by_src, count 5, seconds 60; reference:url,doc.emergingthreats.net/2002910; classtype:attempted-recon; sid:2002910; rev:5; metadata:created_at 2010_07_30, updated_at 2010_07_30;)
```

1. Break down the Sort Rule header and explain what is happening.

   **Answer:** This Snort rule is an alert for a TCP rule for all packets coming from the public, external internet into the home network over the port rage 5800 to 5820. This will will let us know if there is a potential emerging threat where someone is SYN scanning these VNC ports from outside of the home network.

2. What stage of the Cyber Kill Chain does this alert violate?

   **Answer:** This alert violates the Reconaissance stage.

3. What kind of attack is indicated?

   **Answer:** This is a port scanning attack using SYN messages to see which ports may be open.

Snort Rule #2

```bash
alert tcp $EXTERNAL_NET $HTTP_PORTS -> $HOME_NET any (msg:"ET POLICY PE EXE or DLL Windows file download HTTP"; flow:established,to_client; flowbits:isnotset,ET.http.binary; flowbits:isnotset,ET.INFO.WindowsUpdate; file_data; content:"MZ"; within:2; byte_jump:4,58,relative,little; content:"PE|00 00|"; distance:-64; within:4; flowbits:set,ET.http.binary; metadata: former_category POLICY; reference:url,doc.emergingthreats.net/bin/view/Main/2018959; classtype:policy-violation; sid:2018959; rev:4; metadata:created_at 2014_08_19, updated_at 2017_02_01;)
```

1. Break down the Sort Rule header and explain what is happening.

   **Answer:** This Snort rule is an alert for a TCP rule for all HTTP packets (unsecured web traffic) coming from the public, external internet into the home network over port 80. This will let us know if someone on the home network has downloaded a Windows executable file or DLL over HTTP.

2. What layer of the Defense in Depth model does this alert violate?

   **Answer:** This alert violates the Host layer of the Defense in Depth model.

3. What kind of attack is indicated?

   **Answer:** This is potentially a C2 (Command and Control) malware attack, a virus, a worm, or a Trojan.

Snort Rule #3

- Your turn! Write a Snort rule that alerts when traffic is detected inbound on port 4444 to the local network on any port. Be sure to include the `msg` in the Rule Option.

```bash
alert tcp $EXTERNAL_NET any -> $HOME_NET 4444 (msg: "Potential Metasploit Intrusion."; flags:SF,CE; reference:url,doc.blog.rapid7.com/2012/06/01/metasploit-exploit-failed-how-to-test-if-metasploit-is-working; metadata:created_at 2020_11_24, updated_at 2020_11_24)
```

### Part 2: "Drop Zone" Lab

#### Log into the Azure `firewalld` machine

Log in using the following credentials:

- Username: `sysadmin`
- Password: `cybersecurity`

#### Uninstall `ufw`

Before getting started, you should verify that you do not have any instances of `ufw` running. This will avoid conflicts with your `firewalld` service. This also ensures that `firewalld` will be your default firewall.

- Run the command that removes any running instance of `ufw`.

    ```bash
    $ sudo ufw status # Check the status of ufw.
    $ sudo ufw disable # Disable any running instances.
    $ sudo apt remove ufw # Remove all ufw packages.
    ```

#### Enable and start `firewalld`

By default, these service should be running. If not, then run the following commands:

- Run the commands that enable and start `firewalld` upon boots and reboots.

    ```bash
    $ sudo service firewalld enable
    $ sudo service firewalld start
    ```

  **Note 1:** This will ensure that `firewalld` remains active after each reboot.
  
  **Note 2:** In the 11.1 Student Guide, to start up firewalld the following commands are recommended:
  
  ```bash
  sudo /etc/init.d/firewalld enable
  sudo /etc/init.d/firewalld start
  ```

#### Confirm that the service is running.

- Run the command that checks whether or not the `firewalld` service is up and running.

    ```bash
    $ sudo service firewalld status
    ```


#### List all firewall rules currently configured.

Next, lists all currently configured firewall rules. This will give you a good idea of what's currently configured and save you time in the long run by not doing double work.

- Run the command that lists all currently configured firewall rules:

    ```bash
    $ sudo firewall-cmd --list-all-zones
    ```

- Take note of what Zones and settings are configured. You many need to remove unneeded services and settings.

#### List all supported service types that can be enabled.

- Run the command that lists all currently supported services to see if the service you need is available

    ```bash
    $ sudo firewall-cmd --get-services
    ```

- We can see that the `Home` and `Drop` Zones are created by default.


#### Zone Views

- Run the command that lists all currently configured zones.

    ```bash
    $ sudo firewall-cmd --get-active-zones
    ```

- We can see that the `Public` and `Drop` Zones are created by default. Therefore, we will need to create Zones for `Web`, `Sales`, and `Mail`.

#### Create Zones for `Web`, `Sales` and `Mail`.

- Run the commands that creates Web, Sales and Mail zones.

    ```bash
    $ sudo firewall-cmd --permanent --new-zone=Web
    $ sudo firewall-cmd --permanent --new-zone=Sales
    $ sudo firewall-cmd --permanent --new-zone=Mail
    ```

#### Set the zones to their designated interfaces:

- Run the command that sets your `eth0` interface to your zones.

    ```bash
    $ sudo firewall-cmd --permanent --zone=public --change-interface=eth0
    $ sudo firewall-cmd --permanent --zone=Web --change-interface=eth1
    $ sudo firewall-cmd --permanent --zone=Sales --change-interface=eth2
    $ sudo firewall-cmd --permanent --zone=Mail --change-interface=eth3
    ```

#### Add services to the active zones:

- Run the commands that add services to the **public** zone, the **web** zone, the **sales** zone, and the **mail** zone.

- Public:

    ```bash
    $ sudo firewall-cmd --permanent --zone=public --add-service=http
    $ sudo firewall-cmd --permanent --zone=public --add-service=https
    $ sudo firewall-cmd --permanent --zone=public --add-service=pop3
    $ sudo firewall-cmd --permanent --zone=public --add-service=smtp
    ```

- Web:

    ```bash
    $ sudo firewall-cmd --permanent --zone=Web --add-service=http
    ```

- Sales

    ```bash
    $ sudo firewall-cmd --permanent zone=Sales --add-service=https
    ```

- Mail

    ```bash
    $ sudo firewall-cmd --permanent --zone=Mail --add-service=smtp
    $ sudo firewall-cmd --permanent --zone=Mail --add-service=pop3
    ```

- What is the status of `http`, `https`, `smtp` and `pop3`?

    ```bash
    $ sudo firewall-cmd --zone=public --query-service=http
    $ sudo firewall-cmd --zone=public --query-service=https
    $ sudo firewall-cmd --zone=public --query-service=smtp
    $ sudo firewall-cmd --zone=public --query-service=pop3
    ```

#### Add your adversaries to the Drop Zone.

- Run the command that will add all current and any future blacklisted IPs to the Drop Zone.

     ```bash
    $ sudo firewall-cmd --permanent --zone=drop --add-rich-rule='rule family="ipv4" source address="10.208.56.23" reject'
    $ sudo firewall-cmd --permanent --zone=drop --add-rich-rule='rule family="ipv4" source address="135.95.103.76" reject'
    $ sudo firewall-cmd --permanent --zone=-ruledrop --add-rich-rule='rule family="ipv4" source address="76.34.169.118" reject'
    ```

#### Make rules permanent then reload them:

It's good practice to ensure that your `firewalld` installation remains nailed up and retains its services across reboots. This ensure that the network remains secured after unplanned outages such as power failures.

- Run the command that reloads the `firewalld` configurations and writes it to memory

    ```bash
    $ sudo firewall-cmd --runtime-to-permanent
    $ sudo service firewalld restart
    ```

#### View active Zones

Now, we'll want to provide truncated listings of all currently **active** zones. This a good time to verify your zone settings.

- Run the command that displays all zone services.

    ```bash
    $ sudo firewall-cmd --get-active-zones
    ```


#### Block an IP address

- Use a rich-rule that blocks the IP address `138.138.0.3`.

    ```bash
    $ sudo firewall-cmd --permanent --zone=drop --add-rich-rule='rule family="ipv4" source address="138.138.0.3" reject'
    ```

#### Block Ping/ICMP Requests

Harden your network against `ping` scans by blocking `icmp ehco` replies.

- Run the command that blocks `pings` and `icmp` requests in your `public` zone.

    ```bash
    $ sudo firewall-cmd --permanent --zone=public --add-icmp-block=echo-reply --add-icmp-block=echo-request
    ```

#### Rule Check

Now that you've set up your brand new `firewalld` installation, it's time to verify that all of the settings have taken effect.

- Run the command that lists all  of the rule settings. Do one command at a time for each zone.

    ```bash
    $ sudo firewall-cmd --zone=public --list-all
    $ sudo firewall-cmd --zone=Web --list-all
    $ sudo firewall-cmd --zone=Sales --list-all
    $ sudo firewall-cmd --zone=Mail --list-all
    $ sudo firewall-cmd --zone=drop --list-all
    ```

- Are all of our rules in place? If not, then go back and make the necessary modifications before checking again.


Congratulations! You have successfully configured and deployed a fully comprehensive `firewalld` installation. **Thank you.**

---

### Part 3: IDS, IPS, DiD and Firewalls

Now, we will work on another lab. Before you start, complete the following review questions.

#### IDS vs. IPS Systems

1. Name and define two ways an IDS connects to a network.

   **Answer 1:** *Test Access Port* / Network TAP

   **Answer 2:** *Switched Port Analyzer* / SPAN 

2. Describe how an IPS connects to a network.

   **Answer:** Inline, typically between the firewall and network switch. 

3. What type of IDS compares patterns of traffic to predefined signatures and is unable to detect Zero-Day attacks?

   **Answer:** Signature Based

4. Which type of IDS is beneficial for detecting all suspicious traffic that deviates from the well-known baseline and is excellent at detecting when an attacker probes or sweeps a network?

   **Answer:** Anomoly based

#### Defense in Depth

1. For each of the following scenarios, provide the layer of Defense in Depth that applies:

    1.  A criminal hacker tailgates an employee through an exterior door into a secured facility, explaining that they forgot their badge at home.

        **Answer:**  Perimeter

    2. A zero-day goes undetected by antivirus software.

        **Answer:** Application

    3. A criminal successfully gains access to HR’s database.

        **Answer:** Data

    4. A criminal hacker exploits a vulnerability within an operating system.

        **Answer:** Host

    5. A hacktivist organization successfully performs a DDoS attack, taking down a government website.

        **Answer:** Network

    6. Data is classified at the wrong classification level.

        **Answer:** Data

    7. A state sponsored hacker group successfully firewalked an organization to produce a list of active services on an email server.

        **Answer:** Network

2. Name one method of protecting data-at-rest from being readable on hard drive.

    **Answer:** A technical method would be encryption with RSA. 

3. Name one method to protect data-in-transit.

    **Answer:** A few technical methods would be HTTPS, SSL, TLS, SFTP, FTPS.

4. What technology could provide law enforcement with the ability to track and recover a stolen laptop.

   **Answer:** Advanced Peristance Technology, a.k.a Mobile Device Management (MDM) software can install modules or profiles to be loaded from the BIOS/UEFI with permanent configurations that are unchangeable from the machine itself. If the machine is booted up and connects to the internet, scripts can then be pre-loaded by the MDM to identify network settings and email.

5. How could you prevent an attacker from booting a stolen laptop using an external hard drive?

    **Answer:** Disable BIOS for the physical ports (such as USB) on the machine.


#### Firewall Architectures and Methodologies

1. Which type of firewall verifies the three-way TCP handshake? TCP handshake checks are designed to ensure that session packets are from legitimate sources.

  **Answer:** Circuit-level gateway.

2. Which type of firewall considers the connection as a whole? Meaning, instead of looking at only individual packets, these firewalls look at whole streams of packets at one time.

  **Answer:** Packet Filtering using Stateless Firewall.

3. Which type of firewall intercepts all traffic prior to being forwarded to its final destination. In a sense, these firewalls act on behalf of the recipient by ensuring the traffic is safe prior to forwarding it?

  **Answer: ** Network Firewall.


4. Which type of firewall examines data within a packet as it progresses through a network interface by examining source and destination IP address, port number, and packet type- all without opening the packet to inspect its contents?

  **Answer:**  Packet Filtering using Stateful Firewall.


5. Which type of firewall filters based solely on source and destination MAC address?

  **Answer:**  MAC Firewall.
