# Registration and Login Example with Spring MVC 4, Spring Security, Spring Data JPA, XML Configuration, Maven, JSP, and MySQL.

## Guide
https://hellokoding.com/registration-and-login-example-with-spring-xml-configuration-maven-jsp-and-mysql/

## Prerequisites
- JDK 1.8 or later
- Maven 3 or later
- MySQL 5.6 or later

## Stack
- Spring MVC
- Spring Security
- Spring Data JPA
- Maven
- JSP
- MySQL

## Run
```mvn jetty:run```


Ansible Plabook Usage Requirements:

Requirements

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
#################### vars file for tomcat7 (UBUNTU)##########################


tomcat_packag: tomcat7

   # java hep mem varibles

max_mem: 512

min_mem: 128 

tomcat_pack_extra: [ "tomcat7-docs", "tomcat7-admin", "tomcat7-examples" ]

   # Manager username and password
tomcat_mang_username: admin

tomcat_mang_password: qttapti


------------------------------
######################## vars file for tomcat (RedHat)###################################
tomcat_pack: [ "tomcat", "tomcat-webapps", "tomcat-admin-webapps" ]

    # java hep mem varibles
max_mem: 512

min_mem: 256

  # Manager username and password
tomcat_user: admin

tomcat_passwd: qttapti

---------------------------
###################### vars file for Deploy #########################################

build_num: 10

url_path: http://34.214.175.185:8081/artifactory/qttapti_sit/{{build_num}}/target/QTtapti-1.0.war

  
  
  
