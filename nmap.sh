#!/bin/bash
nmap --spoof-mac- Cisco --data-length 24 –T paranoid –max-hostgroup 1 – max-parallelism 10 -PN -f –D 10.1.20.5,RND:5,ME --v –n –sS –sV–oA /desktop/pentest/nmap/out –p T:1-1024 –random-hosts 10.1.1.10 10.1.1.15


# --spoof-mac-Cisco Spoofs the MAC address to match a Cisco product.
# Replacing Cisco with 0 will create a completely
# random MAC address.

# --data-length 24 Appends twenty-four random bytes to most packets
# that are sent.

# -T paranoid Sets the time to the slowest setting—paranoid.

# -- max-hostgroup Limits the hosts that are scanned at a time.

# -- max-parallelism Limits the number of outstanding probes that are sent out. You can also use the --scan-delay option to set a pause between the probes; however,this option is not compatible with the --max_parallelism option.

# -PN Does not ping to identify active systems (this can leak data).

# -f Fragments the packets; this will frequently fool low-end and improperly configured IDs.

# -D 10.1.20.5, RND:5,ME Creates decoy scans to run simultaneously with the attacker's scans; hides the actual attack.

# -n No DNS resolution; internal or external DNS servers are not actively queried by nmap for DNS information. Such queries are frequently logged, so the query function should be disabled.

# -sS Conducts a stealth TCP SYN scan, which does not complete the TCP handshake. Other scan types (for example, Null scans) can also be used; however,most of these will trigger detection devices.

# -sV Enables version detection.

# -oA /desktop/pentest/nmap Outputs the results to all formats (normal, greppable,and XML).

# -p T:1-1024 Specifies the TCP ports to be scanned.

# -- random-hosts Randomizes the target host order
