# kns-ks
# Install
```
git clone https://github.com/shanaider/kns-ks.git
cd kns-ks
sudo cp kubeselect /usr/local/bin/kubeselect
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

# fzf

```
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

source ~/.bashrc
```
ref. https://github.com/ahmetb/kubectx?tab=readme-ov-file#interactive-mode
