# Web

This page contains information about the web part of the course.

This should be filled with information,
But it is not right now.
You can submit a PR to fix this!


## lecture 1:

* 20% lab
* 40% web
* 40% database


### organisations:

W3C --> negotiator between browsers so implementations are standardised between browsers
IETF --> Request for Comment

### HTTP

#### HTTP/1.1, RFC 2086

more support

server waits
client initiates conversation (request)
server handles requests (response)



#### HTTP/2, RFC 7540

less support


#### Content type
MIME:

pattern:
[primary object type]/[subtype]
examples:

* text/plain
* text/html
* image/jpg
* unknown/unknown
* application/xml
* model/mesh

#### Content length

if size of body doesnt match header length --> reject

also important for persistent connections. if multiple http requests are sent this field can help the browser
find the end of the stream of requests

#### Content encoding

tells what kind of compression the server or client understands and thus can send to eachother.

advantage: less bandwidth
disadvantage: more cpu time

examples:

* gzip
* deflate
* identity

#### Content MD5

removed in HTTP 2.0 though it's still used.
used to verify content. 

md5 is a hash computed of the entire body. if a bit is changed the md5 is different. so if the client recalculates md5 and it doesnt match the server knows there is something wrong

#### Expires

lets the client know when the content is not valid anymore and the client has to re-request it. this however has in history rarely actually been used by clients and is mostly used by webcaches. when a webcache has a recource, and it is not expired it will serve it, else it is forwarded to the origin server (Eventually, it might go through multiple webcaches)

web browsers also cache webpages. Therefore nowadays the expires field is more useful for clients too.

#### Last modified

again mostly used by webcaches to know when it has to re-request data to cache. used to be used by search engines to give higher rankings to recently modified pages. due to abuse searchengines dont do this anymore. 

#### Connection & Upgrade

Used so the server can push to clients (instead of client initiating requests)

simulating server --> client requests:
* polling
* long polling (server keeps conenction open until new data arrived)

HTTP/1.1 doesnt allow more than this

##### Websocket protocol:

enables bidirectional communcation between client and server
  


client initiates bidirectional communication
client sends 2 headers:

if server allows connection upgrade to  websockets
then bidirectional communication is established

  


#### Status code

1xx
  informational

2xx
  request ok

3xx
  redirected, resource moved

4xx
  client error
  404 resource not found
  
  402: reserved for *payment requred*

5xx
  server error
  should never be seen. server errors shouldnt be seen by clients!
  
  

### HTTP Methods
 
GET
  sends resource, header and body

HEAD
  only send the header, no body

POST
   WIP
   
PUT
  WIP

TRACE
  WIP

OPTIONS
  WIP

DELETE
  WIP

### IP addresses

DNS server converts domain name to ip address

ipv4:

xx.xx.xx.xx (hex numbers)
max 2^32 ip adresses
push to convert to ipv6

ipv6:

xxxx:xxxx:xxxx:xxxx:xxxx:xxxx:xxxx:xxxx (hex numbers)
2^128 possibilities







