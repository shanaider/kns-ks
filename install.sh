#!/bin/bash

PATH_TO_BIN="/usr/local/bin"

# Install software
cd
mkdir -p ~/.local/bin

# tmux
sudo yum update && sudo yum install -y tmux

#kubeselect
cp sourcetool/kubeselect $PATH_TO_BIN/kubeselect && chmod +x $PATH_TO_BIN/kubeselect

#yq
wget https://github.com/mikefarah/yq/releases/download/v4.27.2/yq_linux_amd64.tar.gz -O -| tar -xz && sudo mv ~/yq_linux_amd64 $PATH_TO_BIN/yq

#jq
wget https://github.com/stedolan/jq/releases/download/jq-1.6/jq-linux64 && chmod +x ~/jq-linux64 && sudo mv ~/jq-linux64 $PATH_TO_BIN/jq

#Helm
wget https://get.helm.sh/helm-v3.14.3-linux-amd64.tar.gz -O -|tar -xz && sudo mv ~/linux-amd64/helm $PATH_TO_BIN/helm

#Kustomize
wget https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2Fv5.3.0/kustomize_v5.3.0_linux_amd64.tar.gz -O -| tar -xz && sudo mv kustomize $PATH_TO_BIN/kustomize

#Kubens
wget https://github.com/ahmetb/kubectx/releases/download/v0.9.5/kubens_v0.9.5_linux_x86_64.tar.gz -O -| tar -xz && sudo mv kubens $PATH_TO_BIN/kubens

# FZF
wget https://github.com/junegunn/fzf/releases/download/0.48.0/fzf-0.48.0-linux_amd64.tar.gz -O -| tar -xz && sudo mv fzf $PATH_TO_BIN/fzf

wget https://github.com/fluxcd/flux2/releases/download/v2.2.3/flux_2.2.3_linux_amd64.tar.gz -O -| tar -xz && sudo mv flux $PATH_TO_BIN/flux

# Install bash completion
kubectl completion bash | sudo tee /etc/bash_completion.d/kubectl
helm completion bash | sudo tee /etc/bash_completion.d/helm
flux completion bash | sudo tee /etc/bash_completion.d/flux
kustomize completion bash | sudo tee /etc/bash_completion.d/kustomize