## Linux Firewall Rules

### Goals

We want to see how easy or difficult it is to manage GCP firewall rules and linux firewall rules

### Considerations 

We are launching Debian latest verion of GCP, we aren't sure what is installed by default

## Investigation

IPTables was already installed, Python3 was already installed. We were able to edit the iptables through commands, direct editing iptables files wasn't possible and even if we could it's not recommended. 

We could have ufw but we wanted to get experience with iptables since on some machines we might not be allowed to install packages. 

## Outcomes

We were able to open port 7000,8000 in GCP firewall rules 

We were able to use curl with a 2 second timeout and reach the website iwth port 8000. (It still would not work for me, no matter what I did to follow along with Andrew, I was able to reach example.com however.)

We were able to block port 8000 on iptables

We were able to redirect from 7000 externally  to 8000 using iptables. (Again, following along but not able to on my end. )

We could not combine port 8000 block and redirect 7000 to 8000 but we suspect its possible. 

It seems that i-ptables is easy when utilizing a AI Coding Assistant eg. ChatGPT so there is no need for ufw unless we didn't have access to an lllm and we wanted to simply use man to quickly learn how to change rules or have an easy to remember how to change rules. 

## Timeline of screenshots

![alt text](/projects/linux-firewal-rules/assets/Screenshot%202025-07-05%20132656.png)
![alt text](/projects/linux-firewal-rules/assets/Screenshot%202025-07-05%20132923.png)
![alt text](/projects/linux-firewal-rules/assets/Screenshot%202025-07-05%20134141.png)
![alt text](/projects/linux-firewal-rules/assets/Screenshot%202025-07-05%20134255.png)
![alt text](/projects/linux-firewal-rules/assets/Screenshot%202025-07-05%20134339.png)
![alt text](/projects/linux-firewal-rules/assets/Screenshot%202025-07-05%20134557.png)
![alt text](/projects/linux-firewal-rules/assets/Screenshot%202025-07-05%20134641.png)
![alt text](/projects/linux-firewal-rules/assets/Screenshot%202025-07-05%20135117.png)
![alt text](/projects/linux-firewal-rules/assets/Screenshot%202025-07-05%20135201.png)
![alt text](/projects/linux-firewal-rules/assets/Screenshot%202025-07-05%20135406.png)
![alt text](/projects/linux-firewal-rules/assets/Screenshot%202025-07-05%20135551.png)
![alt text](/projects/linux-firewal-rules/assets/Screenshot%202025-07-05%20135846.png)
![alt text](/projects/linux-firewal-rules/assets/Screenshot%202025-07-05%20140359.png)
![alt text](/projects/linux-firewal-rules/assets/Screenshot%202025-07-05%20144442.png)
![alt text](/projects/linux-firewal-rules/assets/Screenshot%202025-07-05%20145006.png)
