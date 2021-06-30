## Intro
You can install Keycloak in all the usual ways
- an archive
- the official container
- the official operator

I do not want to manage a VM and I do not want to use the operator so the purpose of this repo is to provide simple K8s YAMLs for deploying the official container with a supporting Postgres database.

## Goals
1. Be as easy to install as possible
1. Use `PersistentVolumeClaim`s so the deployment is stable enough to use in a home lab

## Non-goals
1. Security. There is no TLS and the passwords are hard coded in `setup.yml`

## Instructions
1. Apply a default StorageClass to your cluster.
1. `kubectl apply -f setup.yml`. No modifications needed.
1. `kubectl apply -f keycloak.yml`
1. Find the NodePort with `kubectl get service keycloak -n keycloak` and access Keycloak through that port