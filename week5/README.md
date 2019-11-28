# Week 5 - Kubernetes

## Notes

- How to set `kubectl` context to the Docker-desktop Kubernetes single-node cluster?

    kubectl config use-context docker-desktop
    # hint using tab will give suggestions for available contexts available via ~/.kube/*

- How to check that `kubectl` is indeed pointing at the docker-desktop cluster?

    kubectl config current-context
    # => returns docker-desktop

- Delete a pod

    kubectl delete -f cat-app.yml

- Simplest way to make a request to application running in pod

    # forward a local port to a port on the pod
    kubectl port-forward cat-app 8080:8080
    curl localhost:8080/cat

A service is not a pod!

    kubectl get services

Port forwarding for services:

    kubectl port-forward service/cat 8080:8080

How to debug pods that are starting up?

    kubectl get pods | grep Crash
    kubectl logs
    kubectl logs meow-d48c45497-ppz4v

How to rollback deployments

    kubectl rollout history deployment.v1.apps/meow # get list
    kubectl rollout history deployment.v1.apps/meow --revision=3 # inspect configuration that was applied with rev 3
    kubectl rollout undo deployment.v1.apps/meow --to-revision=3 # roll it back to rev 3

Creating a configmap

    kubectl create configmap meow-config --from-literal=DO_YOU_LIKE_CATS=yep --from-literal=CATS_URL=http://cat:8080/cats

    kubectl describe configmaps meow-config

