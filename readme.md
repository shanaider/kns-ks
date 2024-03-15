# Install K3D For Private Provision K8S Cluster
**Requirement**  
: [KubeCTL](#kubectl)**  
**Optional Add-On**  
-[Kubens - Kubeselect](#kubeselect--kubens--kubectx)  
-[JQ-YQ](#jq-yq)  
-[Helm](#helm)

***Simple Deploy to test  
-[Vote](#simple-app-vote-deploy)  
-[Nginx](#simple-nginx)

# KubeCTL
> Install on linux
```
curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.16.0/bin/linux/amd64/kubectl
chmod +x  kubectl
sudo mv kubectl /usr/local/bin/kubectl
```
> Link to WindowPath
```
windowsUser=$1
mkdir -p ~/.kube
ln -sf "/mnt/c/users/$windowsUser/.kube/config" ~/.kube/config
```
If not work : Check Config DNS 
```
cat /etc/hosts
cat /etc/resolv.conf
```
# Kubeselect & Kubens & Kubectx
ref \
https://github.com/ahmetb/kubectx
https://zerokspot.com/weblog/2019/05/31/kubeselect/
```
git clone https://github.com/shanaider/kns-ks.git
cd sourcetool
sudo cp kubeselect /usr/local/bin/kubeselect
sudo cp kubectx /usr/local/bin/kubectx
sudo cp kubens /usr/local/bin/kubens
```

# Alias
add the detail on ~/.bashrc file
```
#kubectl
source <(kubectl completion bash)
alias k=kubectl
complete -o default -F __start_kubectl k
alias kns="/usr/local/bin/kubens"
alias ks='eval $(kubeselect select --dotkube-dir "~/.kube/")'
alias ks='eval $(kubeselect select)'
alias kdp="kubectl describe pod "
alias kp="kubectl get pod"
```
**Noted: kubeselect only support file .yml / .yaml

# FZF 
Ref \
https://github.com/ahmetb/kubectx?tab=readme-ov-file#interactive-mode \
https://github.com/junegunn/fzf 
```
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

source ~/.bashrc
```

# JQ YQ
Json Query
```
wget https://github.com/mikefarah/yq/releases/download/v4.27.2/yq_linux_amd64.tar.gz -O -| tar -xz && mv ~/yq_linux_amd64 /usr/local/bin/yq
```
Yaml Query
```
wget https://github.com/stedolan/jq/releases/download/jq-1.6/jq-linux64 && chmod +x ~/jq-linux64 && mv ~/jq-linux64 /usr/bin/jq
```

# Helm
```
wget https://get.helm.sh/helm-v3.14.3-linux-amd64.tar.gz -O -|tar -xz && mv ~/linux-amd64/helm /usr/local/bin/helm
```

# Kustomize
Ref: https://kubectl.docs.kubernetes.io/installation/kustomize/binaries/

```
curl -s "https://raw.githubusercontent.com/kubernetes-sigs/kustomize/master/hack/install_kustomize.sh"  | bash
```


# K3D
Ref. \
https://k3d.io/v5.6.0/#installation
```
curl -s https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash

k3d cluster create mycluster
k3d kubeconfig get mycluster > /xxx/.kube/mycluster.yaml #Create Kubeconfig
```

# Simple App Vote Deploy
manifest ref
https://github.com/kodekloudhub/example-voting-app-kubernetes

Check All yaml in kustomize
```
cd simplevoteapp-manifest
kustomize build . 
```
Apply All in kustomize
```
kubectl apply -k .
```

port-forward 
```
k port-forward svc/voting-service -n votingapp 8080:80
k port-forward svc/result-service -n votingapp 8080:80
```

# Simple Nginx
```
# Stateless Nginx 
Ref: https://kubernetes.io/docs/tasks/run-application/run-stateless-application-deployment/

Run this command or apply file nginx.yaml
```
kubectl apply -f https://k8s.io/examples/application/deployment.yaml
```
