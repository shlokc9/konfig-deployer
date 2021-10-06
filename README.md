# konfig-deployer - automate your deployments

## Motivation: 

Let's say you want to provide users another way to create deployments. Since creating deployment manifest is a bit harder. You would just ask users to create a configmap with image of the deployment and how many replicas that deployment is going to run. So, users will create configmap and the controller would create deployment for every relevant configmap. Now there are chances that we won't want deployment to be created for every configmap, so we can have check that every configmap that has specific labels would be entertained.

## How it works?

Once the application is running, user can spawn a deployment via configmaps.

Just mention the foll. fields in your configmap to deploy an image automatically as a deployment;
``` {.sourceCode .bash}
apiVersion: v1
kind: ConfigMap
metadata:
    # Update the name
    name: sample-configmap
    labels: 
        app: auto-deployment
data: 
    DeploymentName: sample-deployment
    DeploymentReplicas: "1"
    DeploymentImage: busybox:latest
```
Resultant deployment will inherit the namespace from configmap.

## How to run konfig-deployer?

Prerequisites: A k8s cluster and a kubectl CLI configured to interact with the cluster.

Run following command to install the application on your k8s-cluster

``` {.sourceCode .bash}
> kubectl apply -f manifests/
```

## How to test konfig-deployer?

Terminal session 1 - Watch the deployments

``` {.sourceCode .bash}
> kubectl get deployments -n default -w
```

Terminal session 2 - Create a configmap with mandatory fields

``` {.sourceCode .bash}
> kubectl apply -f test/
```
You can now see a new deployment running in Terminal session 1

Note: Make sure you are watching the same namespace where the configmap is created.

Thank you :)
