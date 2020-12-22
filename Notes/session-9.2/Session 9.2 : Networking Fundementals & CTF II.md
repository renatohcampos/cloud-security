# Bootcamp PPT#25
## Session 9.2 Networking Fundamentals & CTF II
**Saturday October 31, 2020** / 6:30-9:30 PM
**Zoom Link:** https://zoom.us/j/2246200754 
**Zoom Password:** 606132

### Expectations

- Validate DNS records with nslookup.
- describe procesesses , protocols, and headers.
- analyze email headers.

### DNS Record Type

- DNS Domain Name System
  - "Phonebook" of the internet.
  - Domain-to-IP address.

- DNS Zone File
  - Lives in DNS server.
  - Files contain TTL indicating cache time length.
  - Files contain records about the domain.

- DNS Types
  - **A Record:** Domain to IP
  - **PTR Record:** IP to Domain
  - **CNAME:** Alias record used to point one domain to another
  - **SOA:** adminsitrative details about the domain
  - **NS:** indicates erver that contains actual DNS records for a domain.

- DNS Email Specific

  - **MX records** directs emails to a specified server for a domain.
  - TXT records are used to include notes related to DNS.
  - SPF Sender Policy Framework (Cross Domain)

- `nslookup`

  - command line tool for loking up DNS records.

    ```
    # Facebook examples
    $ nslookup facebook.com
    $ nslookup -type=ns facebook.com
    $ nslookup -type=mx facebook.com
    $ nslookup -type=A facebook.com
    $ nslookup -type=SOA facebook.com
    $ nslookup -debug facebook.com
    $ nslookup -type=any facebook.com
    ```

- Email Example:

  1. Bob uses microsoft outlook to send email.
  2. Bob's mail server finds Alice's mail server.
  3. Bob's mail server forwads the email to Alice's email server

- POP3 / IMAP

- Unfamiliar Email Fields

  - Return Path
  - Received
  - Message-ID
  - Received SPF

  

