# Samba4HPS 
### Samba File Server για τον Ελληνικό Δημόσιο Τομέα (και όχι μόνο...)
#### ... γιατί ένας **ασφαλής**, εύκολα εγκαταστήσιμος, διαχειρίσιμος και **δωρεάν** File Server είναι παραπάνω από απαραίτητος για τις μεσαίου και μεγάλου μεγέθους Δημόσιες Υπηρεσίες...

<p align="justify">
Μια προρυθμισμένη έκδοση <A href="https://www.debian.org/index.el.html"> Debian Linux </A> σε μορφή εγκαταστάσιμου iso, με σκοπό να βοηθήσει τους διαχειριστές να εγκαταστήσουν και να λειτουργήσουν έναν <A href="https://www.samba.org/"> Samba </A> file server στις Ελληνικές Δημόσιες Υπηρεσίες μέσα σε λίγα μόλις λεπτά. Η εγκατάσταση είναι αυτοματοποιημένη (το δυνατόν) κάνοντας χρήση των μεθόδων που προσφέρει η preseed δυνατότητα. Όλα τα αρχεία καθώς και το ISO διανέμονται σύμφωνα με την άδεια χρήσης GNU General Public License v3.0, οπότε μπορείτε εύκολα να δείτε τις αλλαγές που έχουμε κάνει. Κατά την διάρκεια της εγκατάστασης θα χρειαστεί να επιλέξετε μόνο τον κωδικό πρόσβασης του υπερχρήστη root, να επιλέξετε σε ποιό τμήμα του δίσκου θα γίνει η εγκατάσταση και που ακριβώς θα εγκατασταθεί ο GRUB. Γίνεται χρήση μόνο του υπερχρήστη root μιας και η διαχείριση του εν λόγω server θα γίνεται μόνο από τον διαχειριστή του συστήματος και το περιβάλλον λειτουργίας του προτείνεται να είναι το εσωτερικό δίκτυο της Υπηρεσίας, χωρίς δυνατότητα πρόσβασης από το διαδίκτυο. Φυσικά, στη συνέχεια απαιτείται η δημιουργία των κοινόχρηστων φακέλων και των χρηστών που θα έχουν πρόσβαση σε αυτούς. Η συγκεκριμένη διαδικασία γίνεται μέσω scripts ώστε να είναι εύκολη ακόμη και από τους αρχάριους χρήστες.
Η λειτουργία του εν λόγω συστήματος έχει δοκιμαστεί σε περιβάλλον εργασίας (δημοσίου) με αρκετούς χρήστες (50+) και είναι συμβατό με όλες τις εκδόσεις των Windows (XP, Vista, 7, 8, 8.1, 10) καθώς και με εκδόσεις Linux όπως Linux Mint, Ubuntu, Debian.
 
 ### **_Μην ξεχνάτε! Πάντα να κάνετε Backup τα δεδομένα σας! Κάθε μέρα!_**

**Τι περιέχεται στο εκκινήσιμο ISO; Δείτε παρακάτω...** (βασισμένο στην έκδοση <A href="https://www.debian.org/distrib/netinst"> Debian Linux 9.0.1 Netinstall 64bit </A>)
  1. <A href="https://www.samba.org/"> Samba </A> (με Κάδο Ανακύκλωσης ανά περιοχή διαμοιρασμού και καταγραφή των λειτουργιών)
  2. <A href="http://www.webmin.com/"> Webmin </A> (διαχειριστικό του server, αρκετά απλό ακόμη και για άπειρους χρήστες Linux)
  3. <A href="http://www.webmin.com/usermin.html"> Usermin </A> (διαχειριστικό, αρκετά απλό ακόμη και για άπειρους χρήστες Linux)
  4. <A href="https://www.fail2ban.org/wiki/index.php/Main_Page"> Fail2ban </A> (προσπαθώντας να προστατεύσουμε τα δεδομένα από ransomware)
  5. <A href="https://rsync.samba.org/"> Rsync </A> (μικρά, κατανοητά bash scripts που κάνουν χρήση rsync για να δημιουργείτε τα backups εύκολα)
  6. <A href="https://danrohde.github.io/webdavcgi/index.html"> WebDAV CGI </A> (Χμμ, Ίσως κάποια στιγμή αργότερα... σε επόμενη έκδοση!)
  7. Κάτι άλλο θα σκεφτούμε ή κάτι που θα προτείνετε...
</p>

**_Διανομές - Σύντομα διαθέσιμες..._**
* Διανομή **ΜΕ** γραφικό περιβάλλον εργασίας χρήστη (GUI) 64bit 
* Διανομή **ΧΩΡΙΣ** γραφικό περιβάλλον εργασίας χρήστη (GUI) <A href="https://github.com/prassaschr/samba4HPS/releases"> 64bit </A>

Στο <A https://github.com/prassaschr/samba4HPS/wiki"> Wiki </A> μπορείτε να δείτε χρήσιμες οδηγίες...

Οι διανομές περιλαμβάνουν δύο (2) κοινόχρηστους πόρους. Ο ένας ονομάζεται public και ο άλλος secret. Παράλληλα, υπάρχει script μέσω του οποίου μπορείτε εύκολα να δημιουργήσετε χρήστες μαζικά με χρήση ενός αρχείου CSV.

# Samba4HPS 
### Samba File Server for Hellenic Public Sector 
#### ... cause a **secure**, easy to administer and **free** File Server is a must for medium and big public organizations...

<p align="justify">
A custom <A href="https://www.debian.org/index.el.html"> Debian Linux </A> iso, preconfigured, to help administrators install and run a <A href="https://www.samba.org/"> Samba </A> server in Hellenic Public Sector in just a few minutes. The installation is semi automated and making use of the preseeding method. All the files and the ISO are published under GNU General Public License v3.0, so you can check everything. During installation you will need to choose only the root password and the partition/s where the system will be installed.

**What's in the bootable iso? Check below...** (based on <A href="https://www.debian.org/distrib/netinsto"> Debian Linux 9.0.1 Netinstall 64bit </A>)
  1. <A href="https://www.samba.org/"> Samba </A> (with Recycle Bin per share and Full Audit - log a lot)
  2. <A href="http://www.webmin.com/"> Webmin </A> (administrate the server easier, best for linux beginners)
  3. <A href="http://www.webmin.com/usermin.html"> Usermin </A> (user administration tool)
  4. <A href="https://www.fail2ban.org/wiki/index.php/Main_Page"> Fail2ban </A> (trying to protect data from ransomware malicious software)
  5. <A href="https://rsync.samba.org/"> Rsync </A> (bash scripts with rsync so you can create backups easily)
  6. <A href="https://danrohde.github.io/webdavcgi/index.html"> WebDAV CGI </A> (Hmm, so everything might be on the web... Maybe in a later release!)
  7. Many more will come or many more you might suggest...
</p>

### **_Dont't forget! Make backup daily!_**

**_Distributions - Available soon..._**
* Distribution **WITH** graphical user interface (GUI) 64bit 
* Distribution **WITHOUT** graphical user interface (GUI) <A href="https://github.com/prassaschr/samba4HPS/releases"> 64bit </A>

In the <A https://github.com/prassaschr/samba4HPS/wiki"> Wiki </A> you can find usefull infos about...

In the file server distributions there are two (2) shared volumes. The one with name public and the other with name secret. In the distro you can find also a script to help you create multiple user's account easily.

[![Samba4HPS Installation](https://img.youtube.com/vi/SsPxNh28xWU/0.jpg)](https://www.youtube.com/watch?v=SsPxNh28xWU "Samba4HPS Installation")
