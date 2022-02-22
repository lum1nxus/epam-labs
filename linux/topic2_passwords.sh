/etc/passwd file contains all data about users without passwords
/etc/shadow file contains hashed passwords according to their users
utilite John the Ripper provides ability to check weak passwords
unshadow /etc/passwd /etc/shadow >> passwd.db
john passwd.db --wordlist=<wordlist>
