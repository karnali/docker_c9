[![CircleCI](https://circleci.com/gh/karnali/docker_c9.svg?style=svg)](https://circleci.com/gh/karnali/docker_c9)



# docker_c9

```
Go to github and create an repo with .gitignore (python) and add readme.  

In cloud9 cd to docker project folder and generate rsa key.  

$ ssh-keygen -t rsa
$ cat /home/admin_/.ssh/id_rsa.pub 
Copy .pub file in github setting ssh key section. (ignore these steps; if already setup.)
```
# Clone from github for exisiting repos.
```
git clone git@github.com:karnali/docker_c9.git
```
# cd to docker_c9 folder in cloud9
```
$ git init
```

# Git remote add 
```
$ git remote add origin git@github.com:karnali/docker_c9.git
$ git pull origin master
```
# Pull changes from github.
```
$ git branch
$ git pull origin master
```
# You should see your README file pulled from github.
```
$ ls -l
-rw-rw-r-- 1 ubuntu ubuntu 22 Feb 10 13:59 README.md

$ sudo wget -O /bin/hadolint https://github.com/hadolint/hadolint/releases/download/v1.17.5/hadolint-Linux-x86_64
$ sudo chmod +x /bin/hadolint 
$ make lint

$ make setup
 python3 -m venv ~/.docker_c9
$ source ~/.docker_c9/bin/activate
$ make install
```

# Test app.py
```
$ chmod +x app.py
$ ./app.py
$ ./app.py --help
```
# Ready to build docker app from above template
```
$ docker build -t karnali/click-app
$ docker build --tag=app .
$ docker image ls
$ docker run -it app bash
```
# Test app.py within docker build.
```
$ ls -l
$ ./app.py
```
# Push to dockerhub
1. Log in on https://hub.docker.com/. 
2. Click on Create Repository.  
3 .Choose a name (e.g. verse_gapminder) and a description for your repository and click Create.  
4.  Log into the Docker Hub from the command line. 
```
$ docker login 
$ cat /home/ubuntu/.docker/config.json

$ docker image ls
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
python              3.7.3-stretch       34a518642c76        8 months ago        929MB


$ chmod +x build_tag_push_tohub.sh
$ ./build_tag_push_tohub.sh This script will tag and uploads an image to DockerHub

$ docker image ls
REPOSITORY                 TAG                 IMAGE ID            CREATED             SIZE
karnali/python-click-app   python-click-app    2720ca83f149        4 hours ago         951MB
python              	   3.7.3-stretch       34a518642c76        8 months ago        929MB
```

# bash into new docker image
```
$ docker run -it karnali/python-click-app:python-click-app bash
```

# Manual tag and push to dockerhub
```
$ docker tag [IMAGE ID] karnali/python-click-app:python-click-app 
$ docker push karnali/python-click-app:python-click-app 
```
# Manual pull from dockerhub
```
$ apt-get install docker (New machine with no docker)
$ docker pull karnali/python-click-app:python-click-app
```
# Docker Image Commands
```
$ docker version
$ docker image ls
$ docker history [IMAGE ID]
$ docker build [URL]
$ docker build -t        Builds an image from a Dockerfile in the current directory and tags the image
$ docker pull [IMAGE ID]
$ docker push [IMAGE ID]
$ docker commit [CONTAINER ID] [NEW_IMAGE_NAME] Create an image from a container
```
# Cleanup docker images
```
$ docker rmi [IMAGE ID]  Remove an image
$ docker rmi -f [IMAGE ID]  Force remove an image
$ docker images --filter "dangling=true" display untagged images
$ docker rmi -f $(docker images -f "dangling=true" -q)   force delete untagged images
```
# Docker Commands for Container 
```
$ docker ps
$ docker ps -a  list running/stooped
$ docker create [IMAGE]
$ docker rename [CONTAINER_NAME] [NEW_CONTAINER_NAME] Rename an existing container
$ docker logs [CONTAINER ID]
$ docker top [CONTAINER ID]
$ docker stats [CONTAINER ID]
$ docker diff [CONTAINER ID]
```
# Run a command in a new container
```
$ docker run [IMAGE] [COMMAND]
$ docker run --rm [IMAGE] – removes a container after it exits.
$ docker run -td [IMAGE] – starts a container and keeps it running.
$ docker run -it [IMAGE] – starts a container, allocates a pseudo-TTY connected to the container’s stdin, and creates an interactive bash shell in the container.
$ docker run -it-rm [IMAGE] – creates, starts, and runs a command inside the container. Once it executes the command, the container is removed.
$ docker rm [CONTAINER ID] Delete a container (if it is not running)
$ docker update [CONTAINER ID] Update the configuration of one or more containers
$ docker start [CONTAINER ID]
$ docker sop [CONTAINER ID]
$ docker restart [CONTAINER ID]
$ docker pause [CONTAINER ID]
$ docker unpause [CONTAINER ID]
$ docker wait [CONTAINER ID]
$ docker kill [CONTAINER ID]
$ docker attach [CONTAINER ID]
```
# Network
```
$ docker network ls
$ docker network inspect [NETWORK ID]
$ docker network connect [NETWORK ID]
$ docker network disconnect [NETWORK ID ] [CONTAINER ID]
$ docker port [CONTAINER ID]
```
