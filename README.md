# K8s Revision 

## Minikube commands

```
❯ minikube status
minikube
type: Control Plane
host: Running
kubelet: Running
apiserver: Running
kubeconfig: Configured
timeToStop: Nonexistent

❯ minikube stop
✋  Stopping node "minikube"  ...
🛑  Powering off "minikube" via SSH ...
🛑  1 nodes stopped.
❯ minikube status
minikube
type: Control Plane
host: Stopped
kubelet: Stopped
apiserver: Stopped
kubeconfig: Stopped
timeToStop: Nonexistent

❯ minikube start
😄  minikube v1.17.1 on Darwin 11.2.1
✨  Using the docker driver based on existing profile
👍  Starting control plane node minikube in cluster minikube
🔄  Restarting existing docker container for "minikube" ...

```

## to COnnect remote cluster you can set evn in current terminal 

### FOR mac / LInux 

```
8095  kubectl  get  nodes  --kubeconfig  Desktop/admin.conf 
 8096  export KUBECONFIG=/Users/fire/Desktop/admin.conf
```

### For windows powershell

``` $env:KUBECONFIG="AbsPAth"

```


# POds 

```
❯ kubectl  get  pods
NAME          READY   STATUS             RESTARTS   AGE
ashishpod1    1/1     Running            1          16h
ashupod-1     1/1     Running            1          17h
hinapod1-1    1/1     Running            1          16h
nag-1         1/1     Running            1          17h
punyapod1     0/1     CrashLoopBackOff   15         17h
punyapod21    0/1     CrashLoopBackOff   12         16h
rajipod-1     1/1     Running            1          17h
sukupod-1     1/1     Running            1          16h
testpod-v1    1/1     Running            1          17h
vpasampod-1   1/1     Running            1          16h
❯ kubectl  get  pods  -o wide
NAME          READY   STATUS             RESTARTS   AGE   IP               NODE          NOMINATED NODE   READINESS GATES
ashishpod1    1/1     Running            1          16h   192.168.54.76    k8s-minion1   <none>           <none>
ashupod-1     1/1     Running            1          17h   192.168.54.85    k8s-minion1   <none>           <none>
hinapod1-1    1/1     Running            1          16h   192.168.27.253   k8s-minion2   <none>           <none>
nag-1         1/1     Running            1          17h   192.168.54.81    k8s-minion1   <none>           <none>
punyapod1     0/1     CrashLoopBackOff   15         17h   192.168.54.89    k8s-minion1   <none>           <none>
punyapod21    0/1     CrashLoopBackOff   12         16h   192.168.54.90    k8s-minion1   <none>           <none>
rajipod-1     1/1     Running            1          17h   192.168.27.251   k8s-minion2   <none>           <none>
sukupod-1     1/1     Running            1          16h   192.168.27.243   k8s-minion2   <none>           <none>
testpod-v1    1/1     Running            1          17h   192.168.27.248   k8s-minion2   <none>           <none>
vpasampod-1   1/1     Running            1          16h   192.168.27.254   k8s-minion2   <none>           <none>

```

## Pod delete 

```
 kubectl delete pods  ashupod-1
```

===

```
❯ kubectl delete pods --all
pod "ashishpod1" deleted
pod "hinapod1-1" deleted
pod "nag-1" deleted
pod "punyapod1" deleted
pod "punyapod21" deleted
pod "sukupod-1" deleted
pod "testpod-v1" deleted


```

