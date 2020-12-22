# Bootcamp PPT#27
## Session 9.3 Networking Fundamentals & CTF III
**Saturday November 7, 2020** / 6:30-9:30 PM
**Zoom Link:** https://zoom.us/j/2246200754 
**Zoom Password:** 606132

### Expectations

- Asymmetric Encryption & Hashing
- Calculate required number of symmetric and asymmetric keys based on the number of exchanged messages.
- Using GPG to generate keys, encrypt and decrypt.
- Use hashes to validate integrity of data.
- use digital signature to validate the authenticity of the data
- Salting: adding a string or value to the password
- Initialization Vector: used to prevent a sequence of text that is identical to a previous sequence from producing the same exact ciphertext when encrypted.

### OpenSSL

- Encryption Example:

  ```
  openssl enc -pbkdf2 -nosalt -aes-256-cbc -in plain.txt -out encrypted.txt -base64 -K E11244295150E6713CD76E9A5112347093BDB6ACBF0C8021ABAE29881130B210 -iv 6B7F0C406297F0D90E3BD65AD1FB94BA
  ```

- Decryption Example:

  ```
  openssl enc -pbkdf2 -nosalt -aes-256-cbc -d -in test.txt -base64 -K 7898C9B21EB5A21535E1606DFF501A047C32936253886619B0B6B5B2E9694DEE -iv EB760DAE9C9259908CB50838EFE6FDFE
  ```

- Disadvantage :

  - key transmission
  - key management

### Asymmetric 

- Symmetric Keys: n(n-1)/2
- Asymetric Keys: 2n

- RSA

### GPG

- command line tool for encryption

### Hashing & Data Integrity

