## Resolver

![alt text](/projects/linux-networking/assets/resolver.png)

For the resolver screenshot I did have to go back into vi to redo the dns. I accidentally added a : at the end of 1.1.1.1 so picture shows I went back in and then the dns shows the 1.1.1.1. Before that the dns was showing a local host dns. We can use the vi or vim or even nano to change the resolvd.conf file to show/add ips for different services we need. Mainly used for internal applications.

## Wget vs Curl

The difference between wget and curl is that the wget downloads the grab. That is why we had to remove the index file after we wget google. 

![alt text](/projects/linux-networking/assets/wget-google.png)
![alt text](/projects/linux-networking/assets/wget-google-index.png)

![alt text](/projects/linux-networking/assets/curl-google.png)
![alt text](/projects/linux-networking/assets/curl-L-google.png)

