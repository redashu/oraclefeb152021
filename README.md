# K8s cluster deployment 

<img src="clsdep.png">

## Manualy deploy k8s cluster using KUBEADM ---

## steps to perform in all the systems 

```
[root@k8smaster ~]# cat setup.sh 
swapoff -a
modprobe br_netfilter
echo '1' > /proc/sys/net/bridge/bridge-nf-call-iptables

yum  install  docker -y
systemctl  enable --now docker  

## install kubeadm 

cat  <<EOF  >/etc/yum.repos.d/kube.repo
[kube]
baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-x86_64
gpgcheck=0
EOF


yum  install kubeadm  kubelet  -y

systemctl enable --now kubelet  

```

## ONly on Master Node 

```
[root@k8smaster ~]# kubeadm  init  --pod-network-cidr=192.168.0.0/16  --apiserver-advertise-address=0.0.0.0  --apiserver-cert-extra-sans=34.231.73.107   
[init] Using Kubernetes version: v1.20.4
[preflight] Running pre-flight checks
	[WARNING IsDockerSystemdCheck]: detected "cgroupfs" as the Docker cgroup driver. The recommended driver is "systemd". Please follow the guide at https://kubernetes.io/docs/setup/cri/
	[WARNING FileExisting-tc]: tc not found in system path
	[WARNING Hostname]: hostname "k8smaster" could not be reached
	[WARNING Hostname]: hostname "k8smaster": lookup k8smaster on 172.31.0.2:53: no such host
[preflight] Pulling images required for setting up a Kubernetes cluster
[preflight] This might take a minute or two, depending on the speed of your internet connection
[preflight] You can also perform this action in beforehand using 'kubeadm config images pull'


```

--- After some time you will see output like this 

```
strap Token
[bootstrap-token] configured RBAC rules to allow certificate rotation for all node client certificates in the cluster
[bootstrap-token] Creating the "cluster-info" ConfigMap in the "kube-public" namespace
[kubelet-finalize] Updating "/etc/kubernetes/kubelet.conf" to point to a rotatable kubelet client certificate and key
[addons] Applied essential addon: CoreDNS
[addons] Applied essential addon: kube-proxy

Your Kubernetes control-plane has initialized successfully!

To start using your cluster, you need to run the following as a regular user:

  mkdir -p $HOME/.kube
  sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
  sudo chown $(id -u):$(id -g) $HOME/.kube/config

Alternatively, if you are the root user, you can run:

  export KUBECONFIG=/etc/kubernetes/admin.conf

You should now deploy a pod network to the cluster.
Run "kubectl apply -f [podnetwork].yaml" with one of the options listed at:
  https://kubernetes.io/docs/concepts/cluster-administration/addons/

Then you can join any number of worker nodes by running the following on each as root:

kubeadm join 172.31.93.53:6443 --token pcknrp.f5mpy9y3w5s8h2uk \
    --discovery-token-ca-cert-hash sha256:0de16e91d0f5b0d5990c88d32e839203bef690241e6235ddbed4bfb32c38136e 
    
 ```
 
 ## Now check nodes from control plane
 
 ```
 
 [root@k8smaster ~]# kubectl  get  nodes
The connection to the server localhost:8080 was refused - did you specify the right host or port?
[root@k8smaster ~]# 
[root@k8smaster ~]# 
[root@k8smaster ~]# 
[root@k8smaster ~]# cd  /etc/kubernetes/
[root@k8smaster kubernetes]# ls
admin.conf  controller-manager.conf  kubelet.conf  manifests  pki  scheduler.conf
[root@k8smaster kubernetes]# 
[root@k8smaster kubernetes]# kubectl  get  nodes  --kubeconfig  admin.conf 
NAME        STATUS     ROLES                  AGE     VERSION
k8smaster   NotReady   control-plane,master   2m24s   v1.20.4
minion1     NotReady   <none>                 68s     v1.20.4
minion2     NotReady   <none>                 61s     v1.20.4

```

## Deploy calico as pod on Master node

```
 13  wget https://docs.projectcalico.org/manifests/calico.yaml
   14  ls
   15  kubectl apply -f  calico.yaml   --kubeconfig admin.conf 
```



## From client system we can connect like 

### Method 1 

```
❯ kubectl  get  nodes  --kubeconfig  admin.conf
NAME        STATUS   ROLES                  AGE     VERSION
k8smaster   Ready    control-plane,master   9m20s   v1.20.4
minion1     Ready    <none>                 8m4s    v1.20.4
minion2     Ready    <none>                 7m57s   v1.20.4

```


### Method 2 

```
❯ export KUBECONFIG=/Users/fire/Desktop/admin.conf
❯ 
❯ kubectl  get  nodes
NAME        STATUS   ROLES                  AGE     VERSION
k8smaster   Ready    control-plane,master   11m     v1.20.4
minion1     Ready    <none>                 10m     v1.20.4
minion2     Ready    <none>                 9m54s   v1.20.4

==== FOr windows powershell only 

$env:KUBECONFIG="pathofadmin.conf"

```

### Method 3

```
 pwd
/Users/fire/.kube
❯ ls
cache                  config                 http-cache             kubectl_autocompletion storage

❯ cp -v  ~/Desktop/admin.conf  config
/Users/fire/Desktop/admin.conf -> config
❯ ls
cache                  http-cache             myminikubeconfig
config                 kubectl_autocompletion storage

```

## Namespace 

<img src="ns.png">

## checking default namespaces in k8s

```
❯ kubectl  get   namespace
NAME              STATUS   AGE
default           Active   24m
kube-node-lease   Active   24m
kube-public       Active   24m
kube-system       Active   24m

```

## more 

```
❯ kubectl  get   ns
NAME              STATUS   AGE
default           Active   24m
kube-node-lease   Active   24m
kube-public       Active   24m
kube-system       Active   24m
❯ kubectl  get  pods
No resources found in default namespace.


```


### kube-system namespace 

```
❯ kubectl  get  pods   -n  kube-system
NAME                                       READY   STATUS    RESTARTS   AGE
calico-kube-controllers-66956989f4-gvkjk   1/1     Running   0          22m
calico-node-mrppq                          1/1     Running   0          22m
calico-node-qskk9                          1/1     Running   0          22m
calico-node-qzpng                          1/1     Running   0          22m
coredns-74ff55c5b-h9phl                    1/1     Running   0          26m
coredns-74ff55c5b-rpwj2                    1/1     Running   0          26m
etcd-k8smaster                             1/1     Running   0          26m
kube-apiserver-k8smaster                   1/1     Running   0          26m
kube-controller-manager-k8smaster          1/1     Running   0          26m
kube-proxy-5qhrd                           1/1     Running   0          25m
kube-proxy-99wcd                           1/1     Running   0          25m
kube-proxy-cfpqd                           1/1     Running   0          26m
kube-scheduler-k8smaster                   1/1     Running   0          26m

```

## creating custom namespace

```
❯ kubectl  create  namespace  ashu-space
namespace/ashu-space created
❯ kubectl  get   ns
NAME              STATUS   AGE
ashu-space        Active   4s
default           Active   30m
kube-node-lease   Active   30m
kube-public       Active   30m
kube-system       Active   30m

```

## changing default namespace 

```
 kubectl  config set-context  --current  --namespace=ashu-space
Context "kubernetes-admin@kubernetes" modified.


```

## checking default namespace 

```
❯ kubectl  config get-contexts
CURRENT   NAME                          CLUSTER      AUTHINFO           NAMESPACE
*         kubernetes-admin@kubernetes   kubernetes   kubernetes-admin   ashu-space

```


