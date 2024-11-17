#!/bin/bash

shopt -s expand_aliases
alias kubectl="minikube kubectl --"

#--------------- rbac ---------------
kubectl apply -f approle.yaml

#--------------- mysql ----------------
read -p "Enter mysql root password : " mysql_root_password
kubectl create secret generic mysql-secret --from-literal=mysql_root_pass=$mysql_root_password
kubectl create configmap mysql-init-script --from-file=init.sql
kubectl apply -f local-sc.yaml
kubectl apply -f mysql-statefulset.yaml
kubectl apply -f mysql-service.yaml
# execute this inside the pod
# "mysql -u root -p$MYSQL_ROOT_PASSWORD < /docker-entrypoint-initdb.d/init.sql" 


#---------------------- redis ------------------------
read -p "Enter redis password : " redis_password
kubectl create secret generic redis-password --from-literal=redis_password=$redis_password
kubectl apply -f redis-primary.yaml
sleep 20
kubectl apply -f redis-replica.yaml


#----------------------- microservices ---------------------
kubectl apply -f app-config.yaml
kubectl apply -f api-server.yaml
kubectl apply -f worker-server.yaml
kubectl apply -f client.yaml
