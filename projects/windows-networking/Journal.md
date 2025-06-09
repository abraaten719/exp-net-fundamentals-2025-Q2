## Developer Environment

<screenshot proof of work of cloud environment>

Describe your cloud environment...
I am having an issue with auto-assign dhcp in aws so I opted for the windows server we created today in azure. (Also I forgot about it running and its been running all day.)

This cloud environment was stood up this morning with just going to virtual machines and creating while following along with Andrew. It was not the template one we couldn't get to work. So all defaults basically apply. 

![alt text](/projects/windows-networking/assets/cloud-environment.png)

![alt text](/projects/windows-networking/assets/cloud-environment-windows.png)

## Ping

'''text
<PS C:\Users\azureuser> ping 8.8.8.8

Pinging 8.8.8.8 with 32 bytes of data:
Reply from 8.8.8.8: bytes=32 time=6ms TTL=112
Reply from 8.8.8.8: bytes=32 time=5ms TTL=112
Reply from 8.8.8.8: bytes=32 time=5ms TTL=112
Reply from 8.8.8.8: bytes=32 time=5ms TTL=112

Ping statistics for 8.8.8.8:
    Packets: Sent = 4, Received = 4, Lost = 0 (0% loss),
Approximate round trip times in milli-seconds:
    Minimum = 5ms, Maximum = 6ms, Average = 5ms
PS C:\Users\azureuser>>
'''
Here I used ping to ping google's server. I knew the ip from previous experience.

## Route

'''text
<PS C:\Users\azureuser> route print
===========================================================================
Interface List
  6...7c 1e 52 99 8b f2 ......Microsoft Hyper-V Network Adapter
  1...........................Software Loopback Interface 1
===========================================================================

IPv4 Route Table
===========================================================================
Active Routes:
Network Destination        Netmask          Gateway       Interface  Metric
          0.0.0.0          0.0.0.0         10.0.0.1         10.0.0.4     11
         10.0.0.0    255.255.255.0         On-link          10.0.0.4    266
         10.0.0.4  255.255.255.255         On-link          10.0.0.4    266
       10.0.0.255  255.255.255.255         On-link          10.0.0.4    266
        127.0.0.0        255.0.0.0         On-link         127.0.0.1    331
        127.0.0.1  255.255.255.255         On-link         127.0.0.1    331
  127.255.255.255  255.255.255.255         On-link         127.0.0.1    331
    168.63.129.16  255.255.255.255         10.0.0.1         10.0.0.4     11
  169.254.169.254  255.255.255.255         10.0.0.1         10.0.0.4     11
        224.0.0.0        240.0.0.0         On-link         127.0.0.1    331
        224.0.0.0        240.0.0.0         On-link          10.0.0.4    266
  255.255.255.255  255.255.255.255         On-link         127.0.0.1    331
  255.255.255.255  255.255.255.255         On-link          10.0.0.4    266
===========================================================================
Persistent Routes:
  None

IPv6 Route Table
===========================================================================
Active Routes:
 If Metric Network Destination      Gateway
  1    331 ::1/128                  On-link
  6    266 fe80::/64                On-link
  6    266 fe80::3a8e:f433:2c48:956a/128
                                    On-link
  1    331 ff00::/8                 On-link
  6    266 ff00::/8                 On-link
===========================================================================
Persistent Routes:
  None
PS C:\Users\azureuser>>
'''
This was something I didn't remember from my studies and this is cool. Prompting with route print will show the route table which is good for adding/removing a private route to a service.

## Tracert

'''text
<PS C:\Users\azureuser> tracert 8.8.8.8

Tracing route to dns.google [8.8.8.8]
over a maximum of 30 hops:

  1     *        *        *     Request timed out.
  2     *        *        *     Request timed out.
  3     *        *        *     Request timed out.
  4     *        *        *     Request timed out.
  5     *
PS C:\Users\azureuser>>
'''
I did a traceroute for google. I wanted to see how many hops till we got to google's site but I believe they blocked me with firewall, or AWS, so I Ctrl>C to stop. 

## Netstat

'''text
<PS C:\Users\azureuser> netstat

Active Connections

  Proto  Local Address          Foreign Address        State
  TCP    10.0.0.4:3389          177:57440              ESTABLISHED
  TCP    10.0.0.4:49676         168.63.129.16:32526    ESTABLISHED
  TCP    10.0.0.4:49684         168.63.129.16:http     ESTABLISHED
  TCP    10.0.0.4:49696         168.63.129.16:32526    ESTABLISHED
  TCP    10.0.0.4:49891         104.208.203.90:https   ESTABLISHED
  TCP    10.0.0.4:58432         168.63.129.16:http     TIME_WAIT
PS C:\Users\azureuser>>
'''
Netstat shows the current active connections to that machine. 

## Ipconfig

'''text
<PS C:\Users\azureuser> ipconfig

Windows IP Configuration


Ethernet adapter Ethernet:

   Connection-specific DNS Suffix  . : tc3m14ahppquzghwfsvwbbfqca.cx.internal.cloudapp.net
   Link-local IPv6 Address . . . . . : fe80::3a8e:f433:2c48:956a%6
   IPv4 Address. . . . . . . . . . . : 10.0.0.4
   Subnet Mask . . . . . . . . . . . : 255.255.255.0
   Default Gateway . . . . . . . . . : 10.0.0.1
PS C:\Users\azureuser>>
'''
Ipconfig has a lot of good information. At work sometimes I used ipconfig /all to see if the IPv4 address was APIPA. I have gotten those a few times over the years.

