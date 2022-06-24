# ansible (Docker Image)

## What is Ansible?
https://www.ansible.com/

https://en.wikipedia.org/wiki/Ansible_(software)

https://docs.ansible.com/ansible/latest/user_guide/index.html

https://docs.ansible.com/ansible_community.html

https://docs.ansible.com/

### Launch Docker Image into a Container, Using:

The following command downloads and launches the already built image from Docker Hub (https://hub.docker.com/r/hammadrauf/ansible)

```
docker run --name ansible-01 -d -it --volume ansible-data:/etc/ansible hammadrauf/ansible
```
OR
The Following command downloads and launches the already built image from Quay.io Regsitry (https://quay.io/repository/hammadrauf/ansible)

```
docker run --name ansible-01 -d -it --volume ansible-data:/etc/ansible quay.io/hammadrauf/ansible
```

### Stop  Container, Using (Database will persist until Container is removed):

```
docker stop ansible-01
```

### Start Already Launched Image (Container) Again, Using (Test Database persistance):

```
docker start ansible-01
```

### To connect to started Container BASH shell:

```
docker exec -it ansible-01  /bin/bash
```

### List All (Active and Non Active) Containers: 

```
docker ps -a
```

### Remove a Container Freeing all resources and deleting Databases, Using:

```
docker rm -f ansible-01
```

### List All Local Images, Using:

```
docker image ls
```

### Delete Particular Image, Using:

```
docker image rm <<IMAGE ID>>
docker image rm b45e3b4b08de
```

### Prune (Delete) unused Images, Using:

```
docker image prune
```

## Build  Customized Image Using:

To custimize the Docker Image and build it yourself locally perform the following steps.
### First clone Git Code locally:
```
git clone https://github.com/hammadrauf/ansible.git
cd ansible
```
Now do your edits to the Dockerfile or other scripts.

### Now Build using:
```
docker build -t ansible .
docker build -t ansible --build-arg ARG_POWER_USER=ansible --build-arg ARG_PU_PWD=ansible .
```

### To run your customized local Image locally (After sucessful build)
```
docker run --name ansible-01 -d -it ansible
```

## All of the Defined Arguments (ARG) are as follows:
```
ARG_POWER_USER (Default=ansible)
ARG_PU_PWD (Default=ansible)
```

## Build Image for DockerHub/Quay.io/Container Registry:

```
docker build --tag <<Your Account Name>>/ansible .
```

## Manual Push Image to Docker Hub OR Quay.IO:
```
docker push .........
```
