
Bandit level 3 -> 4
```bash

bandit3@bandit:~$ ls
inhere
bandit3@bandit:~$ cat inhere/
cat: inhere/: Is a directory
bandit3@bandit:~$ ls -la inhere/
total 12
drwxr-xr-x 2 root    root    4096 Sep 19 07:08 .
drwxr-xr-x 3 root    root    4096 Sep 19 07:08 ..
-rw-r----- 1 bandit4 bandit3   33 Sep 19 07:08 ...Hiding-From-You
bandit3@bandit:~$ ls                                                                                                 
inhere
bandit3@bandit:~$ cd inhere/
bandit3@bandit:~/inhere$ ls -la
total 12
drwxr-xr-x 2 root    root    4096 Sep 19 07:08 .
drwxr-xr-x 3 root    root    4096 Sep 19 07:08 ..
-rw-r----- 1 bandit4 bandit3   33 Sep 19 07:08 ...Hiding-From-You
bandit3@bandit:~/inhere$ cat ...Hiding-From-You 
2WmrDFRmJIq3IPxneAaMGhap0pFhF3NJ
bandit3@bandit:~/inhere$ exit

```

---

Bandit level 4 -> 5
```bash
bandit4@bandit:~$ find . -type f | grep "\-file" | xargs file
./inhere/-file08: data
./inhere/-file02: data
./inhere/-file09: data
./inhere/-file01: data
./inhere/-file00: data
./inhere/-file05: data
./inhere/-file07: ASCII text
./inhere/-file03: data
./inhere/-file06: data
./inhere/-file04: data
bandit4@bandit:~$   

---

bandit level 5 -> 6
```bash
bandit5@bandit:~$ find . -type f ! -executable -size 1033c | xargs cat | xargs
HWasnPhtq9AVKe0dmk45nxy20cvUa6EG
bandit5@bandit:~$ exit
logout
Connection to bandit.labs.overthewire.org closed.
❯ sshpass -p 'HWasnPhtq9AVKe0dmk45nxy20cvUa6EG' ssh bandit6@bandit.labs.overthewire.org -p 2220
```


---

bandit level 6 -> 7
```bash
bandit6@bandit:/$ find . -type f -user bandit7 -group bandit6 -size 33c 2>/dev/null            
./var/lib/dpkg/info/bandit7.password
bandit6@bandit:/$ find . -type f -user bandit7 -group bandit6 -size 33c 2>/dev/null | xargs cat
morbNTDkSW6jIlUc0ymOdMaLnOlFVAaj
bandit6@bandit:/$ 
```

---

bandit level 15 -> 16
```bash
❯ sshpass -p 'kSkvUpMQ7lBYyCM4GBPvCvT1BfWRy0Dx' ssh bandit16@bandit.labs.overthewire.org -p 2220
```

---
