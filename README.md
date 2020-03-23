# Demo App 

This is a demo app developed in Golang which connects to elasticsearch database and fetches the build/release data , calculates several metrics and sends email to respective owners (email currently disabled).

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

Before starting deployment make sure you have following installed in your system

```
Docker
```
```
kubectl(version > 1.16) with path configured
```
```
minikube (version >1.17)
```
### Deployment/Installing

A step by step series of examples that tells  how to get the app running

Step1 - Clone the repo
```
git clone https://github.com/utkarshsudhakar/demo_app.git
```
Step 2 - go to the directory
```
cd demo_app
```
Step 3 - Build the image from Dockerfile using following cmd
```
docker build -t kube/demo_app_new:v2 .
```
Step 4 - Deploy on kubernetes cluster using the deployment.yml file
```
kubectl apply -f deployment.yml 
```
Step 5 - Expose the nodePort 
```
kubectl expose deployment demo --type=LoadBalancer --port=4047
```
Step 6 - To make sure demo app is running , use the following test url -
```
<minikube-ip>:<nodePort>/test
```
  where 'minikube-ip' can be obtained by using cmd- "minikube ip"
  and 'nodeport>' can be obtained by using cmd- "kubectl get service demo" 


## Example

Suppose minikube ip is 192.168.10.4 and nodePort is 30108 , then test url can be run as follows -
```
192.168.10.4:30108/test
```
The result should be this if app is running successfully -

```
{"ResponseCode":200,"Message":"OK"}
```
