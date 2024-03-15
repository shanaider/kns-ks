#!bin/bash

#yq
wget https://github.com/mikefarah/yq/releases/download/v4.27.2/yq_linux_amd64.tar.gz -O -| tar -xz && mv ~/yq_linux_amd64 ~/.local/bin/yq

#jq
wget https://github.com/stedolan/jq/releases/download/jq-1.6/jq-linux64 && chmod +x ~/jq-linux64 && mv ~/jq-linux64 ~/.local/bin/jq

#Helm
wget https://get.helm.sh/helm-v3.14.3-linux-amd64.tar.gz -O -|tar -xz && mv ~/linux-amd64/helm ~/.local/bin/helm

#Kustomize
wget https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2Fv5.3.0/kustomize_v5.3.0_linux_amd64.tar.gz -O -| tar -xz && mv kustomize ~/.local/bin/kustomize