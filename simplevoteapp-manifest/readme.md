# Simple App Vote Deploy
manifest ref
https://github.com/kodekloudhub/example-voting-app-kubernetes

Check All yaml in kustomize
```
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
