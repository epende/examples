# Docker
alias dup="docker ps -a | grep Up"
alias drm='docker rm -f'
alias dcu='docker-compose up -d'
alias dcd='docker-compose down'
alias dcb='docker-compose build'
alias da='docker ps -a'
alias dil="docker image list"

# Kubernetes
export KUBECONFIG=/etc/kubernetes/admin.conf
alias ka="kubeadm"
alias k=kubectl
alias kd="k delete"
alias kc="k create -f"
alias kp="kubectl get pods --all-namespaces -o wide --show-labels"
alias kn="k get nodes"
alias dr="echo --dry-run -o yaml"
alias kuc="k config use-context"
alias kt="kubectl top"
alias kcan="k auth can-i"
kap="k api-resources"
alias kgd="kubectl get deployments"
alias kgd="kubectl get deployments"
alias kp="kubectl get pods -o wide"
alias kp="k get pods --all-namespaces"
alias kgp="k get pods --all-namespaces"
alias kdd="k delete deployment"
alias kdsc="k describe deployment"
alias kl="k logs"
alias kdpv="k delete persistentvolume"
alias kdpvc="k delete persistentvolumeclaim"
alias kdp="k describe pod"
alias kgpv="k get persistentvolumes"
alias kgpvc="k get persistentvolumeclaims"
alias kexec="k exec --stdin --tty -c"
alias dp="kdp $(kp | grep -v NAME | grep -v kube-system | head -1 | awk '{print $2}')"
export cs="--cri-socket /var/run/dockershim.sock"
export an="--all-namespaces"
alias sd="while(true); do kgd; sleep 3; done"

# Others
alias vb="vi ~/.bashrc"
alias sb="source ~/.bashrc"
alias virsh="virsh -c qemu:///system"
alias os="openssl x509 -noout -text -in"
alias cb="cat ~/.bashrc"

# Exec shell on a container
eit (){
  docker exec -it $1 /bin/bash
}

# Exec shell on k8s container
kxc () {
  export PN=$(kp | grep ${PODSTR} | awk '{print $2}')
  k exec --stdin --tty $PN  -c $1 -- /bin/bash
}

# Tag and push an image
dtp () {
  name=$(echo $1 | awk -F'/' '{print $2}')
  docker tag $name $1
  docker push $1
}

# Un-read-only a BTRFS snapshot
btrf (){
  /sbin/btrfs property set -ts $1 ro false
  rm -rf $1
}
