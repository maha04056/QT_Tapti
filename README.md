# JavaBasedInternetapplication.
Online Registration and Login pages for enrolling in E-commerce web site
Tool Stack:

1.	Version Control     : Git
2.	CI                          :  jenkins 2.7
3.	Build                      : Maven 3.3.9
4.	CM                         : Ansible 2.2, Python2.7
5.	Artifactory               : Jfrog 5.5
6.	Containerization     : Docker 1.13 , K8S 1.7.X
7.	Cloud                      : AWS
8.	Virtualization           : Vagrant 1.9.3 , VirtualBOx 5.0

Project Pipeline (workflow):
1)CI_DEV jobs run builds and unit tests every 2hrs  after code  commit code into git. Result Send mails.

2)CI_SIT jobs run every night at 2AM. After success of sat build the war file  will be deploy in SIT environment and push in SAT_Repo(jfrog). Result Send mails

3)CI_UAT jobs builds run every night at 2AM. After success of uat build war file deploy in UAT environment and push in UAT_Repo(jfrog) Result send mails

4)CD_Deliver jobs after successfully completed and approved by UAT, the war file move in Prod_Repo(jfrog). Result Send mails


## Run
```mvn jetty:run```


## Ansible Plabook Usage Requirements: ######



 This role requires Ansible 2.4 or higher and platform requirements are listed in the metadata file.

OS specifications:
- Ubuntu: 16.04
- Redhat 7
- CentOs 7

If you are using this Plabooks By default installing the
  - Openjdk 8 
  - tomcat7
  - Deploying war file to application server 
  
  
Role Variables

  The variables that can be passed to this role and a brief description about them are as follows.
  
  ################## Java##########################################
  # vars file for java
  Ubuntu_java: openjdk-8-jdk 

  Redhat_java: java-1.8.0-openjdk
  
  ---------------------------------
# vars file for tomcat7 (UBUNTU)


tomcat_packag: tomcat7

    java hep mem varibles

max_mem: 512

min_mem: 128 

tomcat_pack_extra: [ "tomcat7-docs", "tomcat7-admin", "tomcat7-examples" ]

   Manager username and password

tomcat_mang_username: admin

tomcat_mang_password: qttapti


------------------------------
# vars file for tomcat (RedHat)

tomcat_pack: [ "tomcat", "tomcat-webapps", "tomcat-admin-webapps" ]

    # java hep mem varibles

max_mem: 512

min_mem: 256

   Manager username and password

tomcat_user: admin

tomcat_passwd: qttapti

---------------------------
## Wars file for Deploy for SIT
Jenkins job as upstream job compile, test, package of war file and push war file into Jfrog.  In same build ENV docker build with latest dev code and push docker image in dockerhub.
docker build -t qttapti/qttapti:${BUILD_NUMBER}  .
docker push qttapti/qttapti:${BUILD_NUMBER}

Jenkins job as downstream job call host and deploy playbook files.
url_path: http://34.214.175.185:8081/artifactory/qttapti_sit/{{build_num}}/target/QTtapti-1.0.war

The above steps to be repeated for UAT
