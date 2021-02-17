# Docker recap 

## cgroups 

```
7907  docker run -d --name x2  --memory 100m --cpus=1  alpine  ping 127.0.0.1
 7908  docker  stats
 7909  history
 7910  docker  ps
 7911  docker  update  x1  --memory 200m 
 7912  docker  update  x1  --help
 7913  docker  update  x1 --memory-swap 100m
 
 ```
 
 ## Docker build from Github 
 
 ```
 7922  docker  build  -t  ashuclang:v1  https://github.com/redashu/cLang.git 
 7923  docker  build  -t  ashuclang:v1  https://github.com/redashu/cLang.git\#main  
 7924  history
 7925  docker  build  -t  ashuclang:v1  https://github.com/redashu/cLang.git\#main  
 7926  docker  ps
 7927  docker images
 7928  docker run -itd --name x4  ashuclang:v1  
 7929  docker  logs -f  x4
 7930  history
 7931  docker rm $(docker ps -aq) -f
 7932  docker images

 7933  docker  rmi   657a59b5de45  e00462997c8c  778a5d68ef1b -f
 
 ```
 
 ## Docker volume 
 
 ```
 ❯ docker  volume  ls
DRIVER    VOLUME NAME
local     44e8bbdc11e43781623ee69b4d323b968538cb1fc4a679969cd2bb5f4df0f4f3
local     ashuvol123
local     htmlwebapps_ashudbdata
local     mycompose_ashudbvol1
❯ docker  volume  prune
WARNING! This will remove all local volumes not used by at least one container.
Are you sure you want to continue? [y/N] y
Total reclaimed space: 0B
❯ docker  volume  ls
DRIVER    VOLUME NAME

```


## Docker volume will be using Host space where docker engine is running 

```
❯ docker  volume  create  vol1
vol1
❯ docker  volume  ls
DRIVER    VOLUME NAME
local     vol1
❯ docker  volume  inspect  vol1
[
    {
        "CreatedAt": "2021-02-17T04:41:28Z",
        "Driver": "local",
        "Labels": {},
        "Mountpoint": "/var/lib/docker/volumes/vol1/_data",
        "Name": "vol1",
        "Options": {},
        "Scope": "local"
    }
]
❯ docker  info  |   grep -i root
 Docker Root Dir: /var/lib/docker
❯ docker  volume  create  vol2
vol2
❯ docker  volume  inspect  vol2
[
    {
        "CreatedAt": "2021-02-17T04:42:08Z",
        "Driver": "local",
        "Labels": {},
        "Mountpoint": "/var/lib/docker/volumes/vol2/_data",
        "Name": "vol2",
        "Options": {},
        "Scope": "local"
    }
]

```

## mounting a specific directory 

```
❯ docker  run  -it  --name check1  -v  /etc:/myhostetc:ro  alpine  sh
/ # ls
bin        etc        lib        mnt        opt        root       sbin       sys        usr
dev        home       media      myhostetc  proc       run        srv        tmp        var
/ # cd  myhostetc/
/myhostetc # ls
afpovertcp.cfg                         localtime                              postfix
aliases                                locate.rc                              ppp
aliases.db                             mail.rc                                profile
apache2                                m

```
