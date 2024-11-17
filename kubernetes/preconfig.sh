#!/bin/bash

shopt -s expand_aliases
alias kubectl="minikube kubectl --"

read -p "Enter your aws access key id " aws_access_key_id
read -p "Enter your aws secret access key: " aws_secret_access_key



kubectl create secret generic aws-secret \
  --from-literal=key_id=$aws_access_key_id \
  --from-literal=access_key=$aws_secret_access_key \
  -n kube-system


kubectl delete -k "github.com/kubernetes-sigs/aws-ebs-csi-driver/deploy/kubernetes/overlays/stable/?ref=release-1.36"
kubectl apply -k "github.com/kubernetes-sigs/aws-ebs-csi-driver/deploy/kubernetes/overlays/stable/?ref=release-1.36"

kubectl apply -f ebs-csi-secret-access.yaml
#kubectl delete deployment ebs-csi-controller -n kube-system
kubectl apply -f ebs-csi-controller.yaml
#kubectl rollout restart deployment ebs-csi-controller -n kube-system

