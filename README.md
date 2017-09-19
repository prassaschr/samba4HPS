# Samba4HPS 
### Samba File Server για τον Ελληνικό Δημόσιο Τομέα (όχι μόνο...)
... γιατί ένας **ασφαλής**, εύκολα εγκαταστήσιμος και διαχειρίσιμος, **δωρεάν** File Server είναι παραπάνω από απαραίτητος για τις μεσαίου και μεγάλου μεγέθους Δημόσιες Υπηρεσίες...

<p align="justify">
Μια δημιουργημένη, προρυθμισμένη έκδοση <A href="https://www.debian.org/index.el.html"> Debian Linux </A> σε μορφή εγκαταστάσιμου iso, ώστε να βοηθήσει τους διαχειριστές να εγκαταστήσουν και να λειτουργήσουν έναν <A href="https://www.samba.org/"> Samba 4 </A> file server στις Ελληνικές Δημόσιες Υπηρεσίες μέσα σε λίγα μόλις λεπτά. Η εγκατάσταση είναι αυτοματοποιημένη (το δυνατόν) κάνοντας χρήση των μεθόδων που προσφέρει η preseed δυνατότητα. Όλα τα αρχεία καθώς και το ISO διανέμονται σύμφωνα με την άδεια χρήσης GNU General Public License v3.0, οπότε μπορείτε εύκολα να δείτε τις αλλαγές που έχουμε κάνει. Κατά την διάρκεια της εγκατάστασης θα χρειαστεί να επιλέξετε μόνο τον κωδικό πρόσβασης του υπερχρήστη root, να επιλέξετε σε ποιό τμήμα του δίσκου θα γίνει η εγκατάσταση και που ακριβώς θα εγκατασταθεί ο GRUB. Γίνεται χρήση μόνο του υπερχρήστη root μιας και η διαχείριση του εν λόγω server θα γίνεται μόνο από το νδιαχειριστή του συστήματος και το περιβάλλον λειτουργίας του προτείνεται να είναι το εσωτερικό δίκτυο της Υπηρεσίας, χωρίς δυνατότητα πρόσβασης από το διαδίκτυο. 

**Τι περιέχεται στο εκκινήσιμο ISO; Δείτε παρακάτω...** (βασισμένο στην έκδοση Debian Linux 9.0.1 netinstall 64bit)
  1. <A href="https://www.samba.org/"> Samba 4 </A> (με Κάδο Ανακύκλωσης ανά περιοχή διαμοιρασμού και καταγραφή των λειτουργιών)
  2. <A href="http://www.webmin.com/"> Webmin </A> (διαχειριστικό του server, αρκετά απλό ακόμη και για άπειρους χρήστες Linux)
  3. <A href="https://www.fail2ban.org/wiki/index.php/Main_Page"> Fail2ban </A> (προσπαθώντας να προστατεύσουμε τα δεδομένα από ransomware)
  4. <A href="https://rsync.samba.org/"> Rsync </A> (μικρά, κατανοητά bash scripts που κάνουν χρήση rsync για να δημιουργείτε τα backups εύκολα)
  5. <A href="https://danrohde.github.io/webdavcgi/index.html"> WebDAV CGI </A> (Χμμ, Ίσως κάποια στιγμή αργότερα... σε νεότερη έκδοση!)
  6. Κάτι άλλο θα σκεφτούμε ή κάτι που θα προτείνετε...
</p>



# Samba4HPS 
### Samba File Server for Hellenic Public Sector 
... cause a **secure**, easy to administer and **free** File Server is a must for medium and big public organizations...

<p align="justify">
A custom <A href="https://www.debian.org/index.el.html"> Debian Linux </A> iso, preconfigured, to help administrators install and run a <A href="https://www.samba.org/"> Samba 4 </A> server in Hellenic Public Sector in just a few minutes. The installation is semi automated and making use of the preseeding method. All the files and the ISO are published under GNU General Public License v3.0, so you can check everything. During installation you will need to choose only the root password and the partition/s where the system will be installed.

**What's in the bootable iso?? Check below...** (based on Debian Linux 9.0.1 netinstall 64bit)
  1. <A href="https://www.samba.org/"> Samba 4 </A> (with Recycle Bin per share and Full Audit - log a lot)
  2. <A href="http://www.webmin.com/"> Webmin </A> (administrate the server easier, best for linux beginners)
  3. <A href="https://www.fail2ban.org/wiki/index.php/Main_Page"> Fail2ban </A> (trying to protect data from ransomware malicious software)
  4. <A href="https://rsync.samba.org/"> Rsync </A> (bash scripts with rsync so you can create backups easily)
  5. <A href="https://danrohde.github.io/webdavcgi/index.html"> WebDAV CGI </A> (Hmm, so everything might be on the web... Maybe in next release!)
  6. Many more will come or many more you might suggest...
</p>
