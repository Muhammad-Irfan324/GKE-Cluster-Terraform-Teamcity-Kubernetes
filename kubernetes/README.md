## AUTHOR - MUHAMMAD IRFAN TAHIR

## Helm -
     - wget https://get.helm.sh/helm-v3.4.1-linux-amd64.tar.gz
     - tar -zxvf helm-v3.4.1-linux-amd64.tar.gz
     - sudo mv linux-amd64/helm /usr/local/bin/helm
     
<br>

## https://github.com/kubernetes/ingress-nginx/tree/master/charts/ingress-nginx

<br>
     
     - kubectl apply -f kubernetes.yaml
     - kubectl get namespaces
     - helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
     - helm repo update
     - helm search repo ingress
     
     
<br>


     NAME                           	CHART VERSION	APP VERSION	DESCRIPTION                                       
     ingress-nginx/ingress-nginx    	3.13.0       	0.41.2     	Ingress controller for Kubernetes using NGINX a...
     stable/gce-ingress             	1.2.2        	1.4.0      	DEPRECATED A GCE Ingress Controller               
     stable/ingressmonitorcontroller	1.0.50       	1.0.47     	DEPRECATED - IngressMonitorController chart tha...
     stable/nginx-ingress           	1.41.3       	v0.34.1    	DEPRECATED! An nginx Ingress controller that us...
     stable/contour                 	0.2.2        	v0.15.0    	DEPRECATED Contour Ingress controller for Kuber...
     stable/external-dns            	1.8.0        	0.5.14     	Configure external DNS servers (AWS Route53, Go...
     stable/kong                    	0.36.7       	1.4        	DEPRECATED The Cloud-Native Ingress and API-man...
     stable/lamp                    	1.1.6        	7          	DEPRECATED - Modular and transparent LAMP stack...
     stable/nginx-lego              	0.3.1        	           	Chart for nginx-ingress-controller and kube-lego  
     stable/traefik                 	1.87.7       	1.7.26     	DEPRECATED - A Traefik based Kubernetes ingress...
     stable/voyager                 	3.2.4        	6.0.0      	DEPRECATED Voyager by AppsCode - Secure Ingress...


<br>

     - kubectl apply -f namespace-teamcity.yaml
     - helm install nginx ingress-nginx/ingress-nginx --namespace teamcity --set rbac.create=true --set controller.publishService.enabled=true
     - kubectl --namespace teamcity get services -o wide nginx-ingress-nginx-controller
     - kubectl get svc -n teamcity
     - kubectl apply -f teamcity-server-ingress-service-pv.yaml
     - kubectl apply -f teamcity-agent-pv.yaml
     
     - After Deploying Open URL and Install server with Database cred
     - Once Dashboard is configured Cick on Agents Tab and in Unauthorized tab you'll see 3 Agents
     - Authorize those Agents in Dashboard
     - Once Authorized All Agents can be seen in Connected Tab
     
## Manfiest Explanation
     - Name Space creation
     - Physical Volume creation for mount with deployments
     - Deployment of Teamcity-Server And Teamcity-Agents
     - Seperate Volumes attached for Data Dir, Logs Dir, Temp Dir, Agent Conf
     - Service created for Teamcity-Server
     - Ingress Service Created for teamcity-Server along with Host URL
     - 1 Deployment Of TeamCity-Server
     - 1 Deployment Of TeamCity-Agent1
     - 1 Deployment Of TeamCity-Agent2
     - 1 Deployment Of TeamCity-Agent3

## Hello-World App
     - kubectl create deployment hello-app --image=gcr.io/google-samples/hello-app:1.0
     - kubectl expose deployment hello-app --port 8080 --target-port 8080
     - kubectl apply -f hello-app-ingress.yaml
     - kubectl apply -f hello-app-service.yaml


