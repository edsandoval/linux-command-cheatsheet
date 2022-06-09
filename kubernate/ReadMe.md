# Kubernates

## Get kubectl contexts
```bash
kubectl config get-contexts

## Get kubernates namespaces

kubectl get ns

## Get all pods from a namespace

kubectl -n {namespace} get pods

# Get all pods from a namespace with more details

kubectl -n {namespace} get pods -o wide

## Apply manifiest file to kubernates

kubectl apply -f {manifiest.yaml}

## Execute command in started pod

kubectl exec -it {podname} -- sh

## Remove or delete a pod

kubectl delete pod {podname}

## Get manifiest from a pod

kubectl get pod {podname} -o yaml

## Delete deployments

kubectl delete deployment {deploymentname}

## Get the persistent volume claims

kubectl get pvc

## Show all kind of kubernates resources

kubectl get all

## Show logs of pod

kubectl logs {podname}
```


