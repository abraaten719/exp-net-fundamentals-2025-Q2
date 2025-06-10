## Restarted the VM for Azure

I restarted the Windows VM in Azure to go to the powershell and do the homework for this video.

## Visualization proof of the server
![alt text](/projects/windows-firewall-rules/assets/Starting-up-the-windows-server.png)

## Adding Python to the windows server

I had opened up a new chat to get python working as a server. Took a few trys to get python installed and it is only the first couple min into the video. But I got it. Started the server.

![alt](/projects/windows-firewall-rules/assets/Running-python-server.png)

## Sites directory

I attempted to go to the sites dir but it doesn't exist on the windows server vm, neither does my repo.

![alt](/projects/windows-firewall-rules/assets/Sites-directory.png)

## Running Hello world on the py server 8000

I was able to create a dir in my main dir for the webserver content. I then created a html file Hello World and then started my py server again on the windows vm server. I was able to see the file. 

![alt](/projects/windows-firewall-rules/assets/Running-python-server-hello%20world.png)

![alt text](/projects/windows-firewall-rules/assets/Running-python-server-hello-world-view-file-in-py-server.png)

### curling from local machine

![alt text](/projects/windows-firewall-rules/assets/win-firewall.png)

When attempting to test the firewalls locally, we determine its hard to test when you are using localhost because Firewalls rules will not block on the same network so we needed to attempt to access the network on a different machine. Overall with the allow rule in place I still was not able to access/curl the vm windows/python server/hello.html file. 
