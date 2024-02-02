# Install K3D For Private Provision K8S Cluster
**Requirement**
: KubeCTL** \
**Optional Add-On** :
Kns ,
Kubeselect
JQ YQ
Helm


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
git clone https://github.com/newkung6/k8sstarter.git
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
wget https://github.com/mikefarah/yq/releases/download/v4.27.2/yq_linux_amd64.tar.gz -O  
tar -zxvf yq_linux_amd64.tar.gz
mv yq_linux_amd64 /usr/local/bin/yq
```
Yaml Query
```
wget https://github.com/stedolan/jq/releases/download/jq-1.6/jq-linux64
mv jq-linux64 jq
chmod 755 jq
mv jq /usr/local/bin
```

# Helm
```
curl https://baltocdn.com/helm/signing.asc | gpg --dearmor | sudo tee /usr/share/keyrings/helm.gpg > /dev/null 
sudo apt-get install apt-transport-https --yes
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/helm.gpg] https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list
sudo apt-get update
sudo apt-get install helm
```

# Kustomize
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