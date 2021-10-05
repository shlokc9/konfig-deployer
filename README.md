# konfig-deployer

### Motivation: Let's say you want to provide users another way to create deployments. Since creating deployment manifest is a bit harder. You would just ask users to create a configmap with image of the deployment and how many replicas that deployment is going to run. So, users will create configmap and the controller would create deployment for every relevant configmap. Now there are chances that we won't want deployment to be created for every configmap, so we can have check that every configmap that has specific labels would be entertained.

### Execution intructions:

Terminal session 1 - Running the application binary

``` {.sourceCode .bash}
> ./bin/konfig-deployer
```

Terminal session 2 - Creating a configMap using the template

``` {.sourceCode .bash}
> kubectl apply -f ./template/configmap-auto-deploy.yaml
```

Terminal session 3 - Monitoring the deployments

``` {.sourceCode .bash}
> kubectl get deployments -n default -w
```
Note: Check the namespace in template prior to running above command

Thank you :)
