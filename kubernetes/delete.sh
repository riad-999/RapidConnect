#!/bin/bash

shopt -s expand_aliases
alias kubectl="minikube kubectl --"


#--------------- mysql----------------
kubectl delete statefulset mysql
kubectl delete role approle
kubectl delete rolebinding approle-binding 
kubectl delete secret mysql-secret 
kubectl delete configmap mysql-init-script
kubectl delete service mysql


kubectl delete deployment redis-primary-deployment
kubectl delete deployment redis-replica-deployment
kubectl delete service redis-primary
kubectl delete service redis-replica

kubectl delete deployment api-server
kubectl delete deployment worker-server
kubectl delete service api-server
kubectl delete service worker-server
kubectl delete configmap app-config
kubectl delete deployment frontend
