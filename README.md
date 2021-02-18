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
