```

jonathan@DESKTOP-B1K4GDE:~$ telnet microsoft.com 80
Trying 40.76.4.15...
Connected to microsoft.com.
Escape character is '^]'.
HEAD / HTTP/1.1
host:microsoft.com

HTTP/1.1 301 Moved Permanently
Date: Mon, 12 Nov 2018 11:22:47 GMT
Server: Kestrel
Location: https://www.microsoft.com/

HEAD / HTTP/1.1
host:www.microsoft.com

HTTP/1.1 404 Not Found
Date: Mon, 12 Nov 2018 11:23:18 GMT
Server: Kestrel

^]

telnet> ^C^Z
[1]+  Stopped                 telnet microsoft.com 80
jonathan@DESKTOP-B1K4GDE:~$ telnet www.microsoft.com 80
Trying 2.20.27.153...
Connected to e13678.dspb.akamaiedge.net.
Escape character is '^]'.
HEAD / HTTP/1.1
host:www.microsoft.com

HTTP/1.1 200 OK
Server: Apache
ETag: "6082151bd56ea922e1357f5896a90d0a:1425454794"
Last-Modified: Wed, 04 Mar 2015 07:39:54 GMT
Accept-Ranges: bytes
Content-Length: 1020
Content-Type: text/html
Date: Mon, 12 Nov 2018 11:24:11 GMT
Connection: keep-alive

GET / HTTP/1.1
host:www.microsoft.com

HTTP/1.1 200 OK
Server: Apache
ETag: "6082151bd56ea922e1357f5896a90d0a:1425454794"
Last-Modified: Wed, 04 Mar 2015 07:39:54 GMT
Accept-Ranges: bytes
Content-Length: 1020
Content-Type: text/html
Date: Mon, 12 Nov 2018 11:24:28 GMT
Connection: keep-alive

<html><head><title>Microsoft Corporation</title><meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7"></meta><meta http-equiv="Content-Type" content="text/html; charset=utf-8"></meta><meta name="SearchTitle" content="Microsoft.com" scheme=""></meta><meta name="Description" content="Get product information, support, and news from Microsoft." scheme=""></meta><meta name="Title" content="Microsoft.com Home Page" scheme=""></meta><meta name="Keywords" content="Microsoft, product, support, help, training, Office, Windows, software, download, trial, preview, demo,  business, security, update, free, computer, PC, server, search, download, install, news" scheme=""></meta><meta name="SearchDescription" content="Microsoft.com Homepage" scheme=""></meta></head><body><p>Your current User-Agent string appears to be from an automated process, if this is incorrect, please click this link:<a href="http://www.microsoft.com/en/us/default.aspx?redir=true">United States English Microsoft Homepage</a></p></body></html>

```
