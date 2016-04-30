Introduction
============

In enterprise software development, it is common that local Dev environment differs from the Test/Staging/Prod environments which are usually centralized servers. Software codes that pass the local compilation and test may still fail when deploy and run on server. This repo provides a docker solution which is supposed to avoid this issue. A developer will be provided a pre-build docker container which has near-identical configuration as server (OS, compilers, test toolsets). Code build and test will happen inside of the docker container, rather than a local computer. The local compute performs as a IDE for code writing as well as a docker host.



Prerequisites
============
* [Docker-Machine](https://docs.docker.com/machine/install-machine/)
* [Vagrant](https://www.vagrantup.com/)

How to Use
============

## Docker Environment Setup
### Option 1. Use Docker-Machine

Create Docker Machine (spin up a VM)

    docker-machine rm docker-build-factory  
    docker-machine create --driver virtualbox docker-build-factor
    eval "$(docker-machine env docker-build-factory)"

Config the port forwarding:

    docker-machine stop docker-build-factory
    VBoxManage modifyvm "docker-build-factory" --natpf1 "tomcat,tcp,,1080,,1080"
    docker-machine start docker-build-factory

To Check the Docker Machine Status

    docker-machine ls  

After Docker Machine is up and running

    ./maven_build.sh

which will build docker image and run docker container


### Option 2. Use Vagrant

Spin up a VM using Vagrant

    vagrant up

Connect to vagrant

    vagrant ssh

Build docker image and run docker container

    sudo su -
    cd /vagrant/
    ./maven_build.sh    

## Test
Once the Maven test server (Tomcat) is up and running (inside of Docker container), you can check the link through the host's web browser: `localhost:1080/greeting`
