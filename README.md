# bWAPP-Assignment

This repo containerize the bWAPP application, using the given Dockerfile. Clone the repo, and build the docker file. Later start the container to access the bWAPP application. 
The default mysql root user is not supported by bwapp application, therefore create the following user and database by going inside the container.

# Dockerfile build 
```
docker build -t assignment-submission-bwapp .

```
![image](https://github.com/namanupmanyu/bWAPP-Assignment/assets/119944194/512b93bb-637f-4996-9abb-b6a48cd6f23b)

# Run docker container 

```
docker run -dit -p 80:80 --name bwapcontainer assignmet-submission-bwapp

```
![image](https://github.com/namanupmanyu/bWAPP-Assignment/assets/119944194/e75274dc-a0b6-4f14-a9e9-2882c7bd94bd)


# Create Mysql user

```
docker exec -it --name bwapcontainer bash

mysql -u root

CREATE USER 'bwapuser'@'localhost' IDENTIFIED BY 'password';
CREATE DATABASE bWAPP;
GRANT ALL PRIVILEGES ON bWAPP.* TO 'bwapuser'@'localhost' ;

```
![image](https://github.com/namanupmanyu/bWAPP-Assignment/assets/119944194/0b16f9d9-0b9d-4d85-a980-ac3d4ad46b2f)


# Access The application 

We launched the docker container over AWS Virtual Machine , make sure to open the port 80 in security group.

The application is accessible at ServerIP/html/login.php

![image](https://github.com/namanupmanyu/bWAPP-Assignment/assets/119944194/3e7c498b-1f67-4881-90b0-9194bdd1c33c)


