## Installing python on a new Windows server via the powershell

'''sh
Invoke-WebRequest -Uri "https://www.python.org/ftp/python/3.10.4/python-3.10.4-amd64.exe" -OutFile "python-installer.exe"; Start-Process -FilePath "python-installer.exe" -ArgumentList "/quiet InstallAllUsers=1 PrependPath=1" -NoNewWindow -Wait

'''

## Starting the python server

'''sh
python -m http.server 8000
'''

## Making the webserver dir to put the hello world file

'''sh
PS C:\Users\azureuser> cd ..
PS C:\Users> cd ..
PS C:\> mkdir C:\webserver


    Directory: C:\


Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
d-----         6/10/2025   4:26 AM                webserver


PS C:\> cd C:\webserver
PS C:\webserver>
'''

'''sh
@"
<!DOCTYPE html>
<html>
<head>
    <title>Hello</title>
</head>
<body>
    <h1>Hello, world!</h1>
</body>
</html>
"@ | Set-Content -Path "hello.html"
'''
'''sh
python -m http.server 8000 --bind 0.0.0.0
'''
'''sh
curl http://127.0.0.1:8000
'''

## PowerShell session output:
PS C:\webserver> ls


    Directory: C:\webserver


Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
-a----         6/10/2025   4:28 AM            114 hello.html


PS C:\webserver>

### Python server output:
Serving HTTP on :: port 8000 (http://[::]:8000/) ...
::1 - - [10/Jun/2025 04:30:58] "GET / HTTP/1.1" 200 -
::1 - - [10/Jun/2025 04:32:03] "GET /hello.html HTTP/1.1" 200 -

### Command to start Python server:
PS C:\webserver> python -m http.server 8000 --bind 0.0.0.0
Serving HTTP on 0.0.0.0 port 8000 (http://0.0.0.0:8000/) ...

### Example HTTP response:
StatusCode        : 200
StatusDescription : OK
Content           : <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
                    <html>
                    <head>
                    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
                    <title>Directory listing fo...
RawContent        : HTTP/1.0 200 OK
                    Content-Length: 342
                    Content-Type: text/html; charset=utf-8
                    Date: Tue, 10 Jun 2025 04:54:16 GMT
                    Server: SimpleHTTP/0.6 Python/3.10.4

                    <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01/...
Forms             : {}
Headers           : {[Content-Length, 342], [Content-Type, text/html; charset=utf-8], [Date, Tue, 10 Jun 2025 04:54:16
                    GMT], [Server, SimpleHTTP/0.6 Python/3.10.4]}
Images            : {}
InputFields       : {}
Links             : {@{innerHTML=hello.html; innerText=hello.html; outerHTML=<A href="hello.html">hello.html</A>;
                    outerText=hello.html; tagName=A; href=hello.html}}
ParsedHtml        : System.__ComObject
RawContentLength  : 342

