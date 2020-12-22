# Bootcamp PPT#30
## Session 11.2 Network Security II
**Saturday November 14, 2020** / 6:30-9:30 PM
**Zoom Link:** https://zoom.us/j/2246200754 
**Zoom Password:** 606132

### Intrusion Detection Snort and Network Secuty Monitoring

### Expectations

- Inpret and define Snort rules.
- Intrusion detection systems vs firewalls.
- Collect and analyze indicators of attack and compromise using NSM.
- Apply knowledge of NSM, Snort rules, and Security Onion to establish situational awareness.

### SecOnion Commands

- `sudo so-status`

- `sudo so-restart`
- `sudo so-replay`

- **Recap**
  - Firewalls protect networks by using rules to make decisions.
  - Firewalls can easily be fooled through packet manipulation.
- **Intrustion Detection System** (IDS)
  - Analyzes packet data.
  - Looks for malicious signatures.

- **Snort**

  - Open Source IDS/IPS
  - Network Security Monitoring (NSM)
  - Perimeter, Network, and Host IDS/IPS
  - **Snort Modes:**
    - Sniffer Mode
    - Packet Logger Mode
    - Network IDS Mode
  - Process of identifying weaknesses in a network.
  - Provides organizations with situational awareness.
  - Snort Example of **Header** and **Rule Option**: 
    - `alert tcp any any -> 10.199.12.8 {msg: "TCP Packet Detected";}`

- **Security Onion**

  - Linux Distro that contains NSM tools.
  - Uses the Snort IDS engine as an event-driven machanism.

- **IDS**

  - IDSs detect and alert attacks.

  - IDSs are passive, they don't respond to attacks.

  - IDSs log and document information for later analysis.

  - IDS helps organizations establish situational awareness.

  - **Signature-based** vs **Anomoly-based**.

  - **Signature-based**:

    - Good for identifying well-known attacks.
    - Can be updated as new attack signature are released.
    - Vulnerable to attacks through packet manipulation.
    - Unable to detect zero-day attacks.

  - **Anomaly-based**:

    - Good for detecting suspicious traffic that deviates from well-known baselines.
    - Excellent at detecting when attackers probe and sweep a network.
    - Prone to false alerts.
    - Assumes network behavior does not deviate from well-known attacks.

  - **IOA** = *Indicator of Attack*

  - **IOC** = *Indicator of Compromise*

    - **TTP** = Techniques, tactics, and procedures.

  -  An **IOA** is "*proactive*" and an **IOC** is "*reactive*."

  - **Intrustion Detection Architecture**

    - *Network Intrusion Detection* **NIDS**
      - Matches all traffic to a known library of attack signatures.
      - Passively examines network traffic at points that its deployed.
      - Relatively easy to deploy and difficult to detect by attackers.
    -  *Host Based Intrustion Detection* **HIDS**
      - Acts as a second line of defense against malicious traffic that successfully gets past an NIDS
      - Examines entire file systems on a host, compares them to previous snapshots or baselines, and generates an alert if there are significant differences between the two. 

  - **IPS**

    - Can do everything an IDS does, but is not passive.

    - *Test Access Port* Network Tap

    - *Switched Port Analyzer* SPAN

    - Requires administrator to react to alerts.

    - **Snort Rule Example:**

      - `alert ip any any -> any any {mesg: "IP Packet Detected";}`

      - ```
        RULE HEADER
        ########################
        
        alert <ALERT>
        
        
        ip <APPLIES RULE TO ALL IPS>
        
        
        any any <ANY INCOMING IP, ANY PORT>
        
        
        -->
        
        any any <ANY INCOMING IP, ANY PORT>
        
        RULE OPTION
        ########################
        
        {msg: "IP Detected;} <MESSAFE TO USER>
        ```

  - Two main differences between a firewall and an IDS system?

    - A firewall restricts access to your network by screening traffic and deciding which packets should be allowed in.
    - An IDS monitors traffic and spots patterns of activity, alerting you if it concludes that your network is under attack.
      Signature detection compares network or system information to attacks already listed in the IDS database.
    - Anomaly detection compares current network traffic to the normal levels of packet size or activity and analyzes the result statistically.

  - The best physical placement for an IDS on a network is mirrored port since inline may cause a bottleneck.

  - An IDS placed at the Perimeter layer of the DiD (Defense in Depth) model is referred to as a **Perimeter IDS**.

- NSM = *Network Security Monitor* 

- FTP File Extraction

  