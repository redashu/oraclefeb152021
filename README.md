# Recap 

<img src="recap.png">

## Containerization 

<img src="dockerfile1.png">

## Docker image internal 

```
❯ docker  inspect hinapy:v1
[
    {
        "Id": "sha256:9634a93273d557b002e026f432a74a0e1c222c923a7da4107bf5cc4bbf3ce1c2",
        "RepoTags": [
            "hinapy:v1"
        ],
        "RepoDigests": [],
        "Parent": "sha256:002412df6155cfc21f32a3aead674d2b52711d7b44a602825fe68464e8de86d9",
        "Comment": "",
        "Created": "2021-02-15T11:39:16.365393768Z",
        "Container": "71d3e469a76441b1d7f6951bfc6330c86a6ca149820590a3ce86cd02cfe27e86",
        "ContainerConfig": {
            "Hostname": "71d3e469a764",
            "Domainname": "",



```

## checking image build history 

```
❯ docker  history  hinapy:v1
IMAGE          CREATED        CREATED BY                                      SIZE      COMMENT
9634a93273d5   17 hours ago   /bin/sh -c #(nop)  CMD ["python3" "while.py"]   0B        
002412df6155   17 hours ago   /bin/sh -c #(nop) WORKDIR /code                 0B        
6fed050aaedb   17 hours ago   /bin/sh -c #(nop) COPY file:d891934aeb1269c8…   60B       
20b71485e679   17 hours ago   /bin/sh -c mkdir /code                          0B        
658ca94e6148   17 hours ago   /bin/sh -c dnf clean all                        1.71MB    
ca1f64d885ee   17 hours ago   /bin/sh -c dnf install python3 -y               122MB     
a64bf62a6b6b   17 hours ago   /bin/sh -c #(nop)  MAINTAINER ashutoshh@linu…   0B        
d8ccb1b24024   10 days ago    /bin/sh -c #(nop)  CMD ["/bin/bash"]            0B        
<missing>      10 days ago    /bin/sh -c #(nop) ADD file:ac3abfcde004b7133…   223MB  

```

# Webapps to docker images

## html webapp using apache httpd with dockerfile

<img src="httpd.png">

## HTtpd web server Dockerfile

```
FROM oraclelinux:8.3
MAINTAINER ashutoshh@linux.com
RUN dnf install httpd -y
# installing httpd web server free & OSS 
COPY . /var/www/html/
#  src  dest 
EXPOSE 80   
# to auto detect default port of httpd server 
# incase user don't wanna define (Optional)
CMD ["httpd","-DFOREGROUND"]
# starting httpd web server using this script command 
# systemd is not supported 

```

## .dockerignore content 

```
Dockerfile
.dockerignore
LICENSE
*.md
.git

```

## Image build process from different location 

```
docker build -t  ashuhttpd:febv1  ./Desktop/mycode/htmlwebapp 

```

## launching container

```
7715  docker  run -d --name ashucx1  -p  1122:80     ashuhttpd:febv1  
 7716  docker  ps
❯ docker  ps
CONTAINER ID   IMAGE               COMMAND                CREATED          STATUS          PORTS                  NAMES
f262143355c6   rajihttpd:v1        "httpd -DFOREGROUND"   9 seconds ago    Up 7 seconds    0.0.0.0:9999->80/tcp   rajihttpd_c1
c4549e66d436   vpasamhttpd:v1      "httpd -DFOREGROUND"   23 seconds ago   Up 21 seconds   0.0.0.0:1140->80/tcp   vpasamhttpd2
22f40d32f6b7   ashuhttpd:febv1     "httpd -DFOREGROUND"   49 seconds ago   Up 47 seconds   0.0.0.0:7001->80/tcp   samv1
2839d15823c3   anauhttpd:febv2     "httpd -DFOREGROUND"   2 minutes ago    Up 2 minutes    0.0.0.0:1234->80/tcp   anaucx1
3b0ecaa923ae   ashishhttpd:febv1   "httpd -DFOREGROUND"   2 minutes ago    Up 2 minutes    0.0.0.0:1133->80/tcp   ashishcx
19b9e183d180   naghttpd:v1         "httpd -DFOREGROUND"   2 minutes ago    Up 2 minutes    0.0.0.0:6011->80/tcp   nagweb
77f4b672ec2e   ashuhttpd:febv1     "httpd -DFOREGROUND"   2 minutes ago    Up 2 minutes    0.0.0.0:1122->80/tcp   ashucx1

```


## Dockerfile with entrypoint 

```
FROM oraclelinux:8.3
MAINTAINER ashutoshh@linux.com
RUN dnf install httpd -y
# installing httpd web server free & OSS 
RUN rm -rf /var/cache/yum/
# removing yum installer cache to optimize image size
# make image light weight 
COPY . /var/www/html/
#  src  dest 
EXPOSE 80   
# to auto detect default port of httpd server 
# incase user don't wanna define (Optional)
ENTRYPOINT httpd, -DFOREGROUND
# as last argument of container creation 
# anything by user will be ignored 

```




