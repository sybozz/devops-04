# DevOps Final Exam for AWS, Jenkins, Kubernetes

Date: 			15 july-20 july  
Submission deadline: 	20 july 11.59PM

# Steps:

## Make github repository

1. Make a repository for application code (base repo)

## Local Development:

1. Choose an frontend application of your choice react/vue/angular or anything of your choice.  
2. Generate a demo application  
3. Change the frontend code as you desire, output page must have your name on it.  
4. Run this locally so that you can see the changes you made in the browser.  
5. **Push the code to the github base repo**

## Docker Development:

1. Write a docker file and dockerize the application  
2. **Push the updates to the github repository, base repo**

## Kubernetes Development:

1. Install minikube/k3s locally.(you can try k3s, docs can be found here https://k3s.io/)  
2. Write deployment and clusterip service for the dockerized application  
3. Run the application in kubernetes environment  
4. Figure out how to install ingress in minikube/k3s  
5. Write an ingressfile for the application  
6. Apply the ingress and browse the application on your browser(might need to research from online)  
7. **push the kubernetes manifest files to the base repository**

## AWS Development:

1.  create a ec2 instance  
   	\- make a aws userdata to   
   		\- install jenkins   
   		\- install docker  
   		\- give jenkins user permission to docker group  
   		\- restart jenkins and docker 

2. Make a file named userdata.sh and paste the aws userdata content in this file.  
3. Push this code to the **base repository** 

## AWS Development 2:

1. In the same jenkins server, in the /var/www folder make a new folder named “app”  
2. Inside app directory use the docker compose file and run the application  
3. Browse on ec2ip:9097 port

## Jenkins Development:

1. Make a pipeline	 named base pipeline  
   1. Should be triggered when merge request is accepted from dev \-\> main branch.  
   2. Upon merge acceptance pipeline is triggered  
   3. Git code is pulled  
   4. Docker image is built  
      1. Image tag should be:  
         pipeline\_build\_number-day-month-hour-minute  
   5. Docker push to dockerhub (using username and password variable  from the jenkins credentials)  
   6. Docker logout  
   7. Clean the workspace  
   8. Use linux commands to update the image tag at dockercompose.yaml file in the /var/www/app directory  
   9. After updating the docker compose file, rerun the docker compose so that the container picks the new image and start with the new image.  
   10. Send a google chat notification (if pipeline successful)  
       1. Notification should be “your application has been updated,  
          Imagename:imagetag”

			

11. Push the code to the repository

