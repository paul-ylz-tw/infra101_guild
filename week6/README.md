# Week 6: Terraform EKS and Helm

## Helm (2) commands

```
  helm init
  kubectl get deployment tiller-deploy -n kube-system
  helm ls
  helm delete nginx-ingress

  helm reset (removes helm from the k8 cluster) (can also use --force)
  # which is same as
  kubectl delete deployment tiller-deploy --namespace kube-system

```

## How to
```
# bring up the EKS cluster on AWS
(login to aws)
cd src
terraform plan
terraform apply # cluster comes up, kubeconfig is written to the source "kubeconfig_paulscluster"

# point kubectl to the cluster
aws eks update-kubeconfig --name <ClusterName>
# confirm target cluster
kubectl config current-context
```
