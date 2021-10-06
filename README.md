# konfig-deployer - Automate your deployments

### Motivation: 

Let's say you want to provide users another way to create deployments. Since creating deployment manifest is a bit harder. You would just ask users to create a configmap with image of the deployment and how many replicas that deployment is going to run. So, users will create configmap and the controller would create deployment for every relevant configmap. Now there are chances that we won't want deployment to be created for every configmap, so we can have check that every configmap that has specific labels would be entertained.

### How it works?

Once the application is running, user can spawn a deployment via configmaps. 

Just mention the following fields in your configmap to deploy an image automatically as a deployment;
1. label: app=auto-deployment
2. data: 
  DeploymentName: sample-deployment
  DeploymentReplicas: "1"
  DeploymentImage: busybox:latest

Resultant deployment will inherit the namespace from configmap

### How to run konfig-deployer?

Prerequisites: A k8s cluster and a kubectl CLI configured to interact with the cluster

Terminal session 1

``` {.sourceCode .bash}
# Deploy and run the application
> kubectl apply -f manifests/

# Watch the deployments
> kubectl get deployments -n default -w
```
Note: Make sure you are watching the appropriate namespace.

ConfigMap template manifest

``` {.sourceCode .bash}
apiVersion: v1
kind: ConfigMap
metadata:
  name: konfig-deployer
  labels:
    app: auto-deployment
data:
  DeploymentName: auto-deployment
  DeploymentReplicas: "1"
  DeploymentImage: busybox:latest

```

Thank you :)
