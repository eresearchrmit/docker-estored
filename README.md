[![Build Status](https://semaphoreci.com/api/v1/projects/d9c5d22b-453b-40b2-a240-842e24a2167b/1082508/badge.svg)](https://semaphoreci.com/gprevost/docker-estored)

Installation
============

1. **Install Docker and Docker Compose**

2. **Retrieve the project from the Bitbucket repository:** https://bitbucket.org/guillaumeprevost/docker-estored

3. **Copy or generate SSL certificate**

	If you have a PKCS12 SSL certificate, copy it into the top directory as 'keystore.p12'.

	If you don't have an SSL certificate, you can generate a self-signed one using makecerts:
	
	***IMPORTANT NOTE:*** *CERTIFICATES GENERATED THIS WAY ARE NOT SECURED AND ARE NOT TO BE USED IN A PRODUCTION ENVIRONMENT.*  

	```
	docker-compose build makecerts
	```
	```
	docker-compose run makecerts
	```

	This should create a SSL self-signed certificate stored into a key store file 'keystore.p12' with a default password 'keystorepw'.

4. **Register your application with AAF Rapid Connect.** This is required to be able to use AAF authentication in the Web Application.

	- 5.1 - Go to https://rapid.aaf.edu.au (or https://rapid.test.aaf.edu.au in a non-production context) and click on "Register your service"
	- 5.2 Log in if needed (using your AAF credentials) Follow the instructions
	- 5.3 - Fill in the form to register the service with AAF Rapid connect (the URL should be https://YOUR.WEB.SERVER.IP:8443, and the callback URL should be https://YOUR.WEB.SERVER.IP:8443/auth/jwt. The other fields are up to you)
	- 5.4 Remember what you enter in the "secret" field as you will need this in your configuration
	- 5.5 - Remember the URL generated by AAF Rapid Connect when you successfully register the service as you will need this in your configuration  

5. **Set up Vislets repository.**

	eStoRED is using a MyTardis repository to store and curate Vislets (snippets of code used for visualising data). You can either use an existing instance of MyTardis storing some Vislets [TODO: add address of repository available]. In that case, skip to the next step. The other option is to set up your own repository following the instructions below.

	- 6.1 - Install MyTardis: https://github.com/ianedwardthomas/docker-mytardis
	- 6.2 - Log into MyTardis as an administrator
	- 6.3 - Create a metadata schema for datafiles with a key-value pair where the key is "handled-data-type" and the value is a String.
	- 6.4 - Create an Experiment and upload your visualisers into Datasets of this MyTardis Experiment. You need to make the Vislet files publicly available for eStoRED to access them.
	- 6.5 - Add metadata "handled-data-type" field using the schema defined in step 6.3 to the Vislet files to define which MIME type they handle (one Vislet can handle multiple MIME types). So far, eStoRED limits data types to: *text/plain, text/csv, application/json, application/vnd.geo+json*

6. **Copy** `env` **file into** `.env` **file**
	
	```
	cp env .env
	```

7. **Edit** `.env` **file to set properties as needed**

	[See env file for documentation of the environment variables.](env)


8. **Build** ***OR*** **retrieve the docker images**

	The recommanded way is to retrieve pre-built and tested docker images from the Docker Hub, using the *pull* command:

	```
	docker-compose pull
	```

	If you want to rebuild the Docker images from the project, you will first need to build the JAR files for eStoRED web application as well as for the different datasources, then place them into their respective folders.
	
	- Copy *estored.jar* in the *estored* folder (see [guillaumeprevost/estored](https://bitbucket.org/guillaumeprevost/estored)).
	- Copy *estored-examples-datasource.jar* in the *estored-examples-datasource* folder (see [guillaumeprevost/estored-examples-datasource](https://bitbucket.org/guillaumeprevost/estored-examples-datasource)).
	- Copy *estored-mytardis-datasource.jar* in the *estored-mytardis-datasource* folder (see [guillaumeprevost/estored-mytardis-datasource](https://bitbucket.org/guillaumeprevost/estored-mytardis-datasource)).
	
	Build the docker images using the *build* command:
	
	```
	docker-compose build
	```
	

9. **Create and start the containers**
	
	```
	docker-compose up -d
	```

Everything should be up and running a few seconds or minutes later.  

You should be able to access the web application at: https://YOUR.WEB.SERVER.IP:8443  

The a container will be created for each datasource but will automatically exit if the datasource is not enabled in the configuration file. If a datasource is enabled, it will listen to messages wth routing key prefixed with *estored.nameofdatasource* (example (*estored.examples.plain.recompute*). See eStoRED documentation for more detailed about data sources.

Docker images used
==================

The **official MySQL docker image** is used without modification.  
Complete documentation of the MySQL Docker imqge at: https://hub.docker.com/_/mysql/  
  
A **modified version of the official RabbitMQ Docker image** is used, in order to enable SSL.  
Complete documentation of the official RabbitMQ image at: https://hub.docker.com/_/rabbitmq/  
  
The **eStoRED** image is a Spring Boot web application with an embedded Tomcat server, based on the official Java 8 Docker image.  
Complete documentation of the official Java image: https://hub.docker.com/_/java/  
Tomcat documentation: http://tomcat.apache.org/  
Spring Boot Documentation: http://docs.spring.io/spring-boot/docs/current/reference/htmlsingle/  

The **makecerts** image generates a self-signed SSL certificate to get the application up and running for development and demonstration purposes. Such certificates are not to be used on a production environment.  

The **eStoRED examples datasource** is a listener for RabbitMQ binding key on a given instance and channel. When receiving a message, the listener attempts to extract information from the message headers to use for selecting example data and send it back. All examples are dummy data to be used as test or demonstration purposes only. **It can be disabled in the .env file"**.

The **eStoRED MyTardis datasource** is a listener for RabbitMQ binding key on a given instance and channel. When receiving a message, the listener attempts to extract information from the message headers to use as connection information to a MyTardis instance. It will retrieve the required data file and send back it's content as RabbitMQ message, with its meta-data as message headers. **It can be disabled in the .env file"**.


License
=======

eStoRED is distributed under the 3-clause "New" BSD License. See [LICENSE.txt](https://bitbucket.org/guillaumeprevost/e-stored/src/master/LICENSE.txt) file.

