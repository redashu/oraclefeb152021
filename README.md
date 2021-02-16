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




