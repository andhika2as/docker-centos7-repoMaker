# Docker compose for creating localrepo / Offline depedencies centos 7

Case scenario:
> If your production environment has no Internet because of regulations, then this better alternative to get depedencies.

> This method using docker as repositories downloader, so we can deploy them in other environment without using any internet.

# docker volume details:
* home/  -- shared with container /root 
* logFile/  -- shared with container /var/log

# For start:

Run start-docker.sh

# for add more tty to running centos (container):
```sh
    docker ps
```
Then check the current running CONTAINER ID (should with NAMES: docker-centos_centos_1)
```sh
    docker exec -ti $CONTAINER_ID /bin/bash
```
# downlad the depedencies:

this git contain example-install.sh file. just move it into home dir and run it inside your container

* you can add more by adding in script file OR
* you can use yumdownloader inside bash container

```sh
    mkdir /root/localrepo
    cd /root/localrepo
    yumdownloader --resolve <Package name>
```

# use the localrepo

> Assume using root and rpm packages stored in /root/localrepo

Quick: run (it will install everything inside localrepo)
```sh
    cd localrepo
    yum install ./*.rpm
```
OR Create localrepo, so you can select which one will be installed from localrepo

* at host: copy file localrepo.repo to home/
* at container: run
```sh
    cp localrepo.repo /etc/yum.repos.d/
    yum --disablerepo=\* --enablerepo=localrepo install <your selected packages>
```
If get error GPG check failure, just skip the GPG check
```sh
    yum --disablerepo=\* --enablerepo=localrepo --nogpgcheck install <your selected packages>
```

# note:

all file generated by container owned by root:root.
you can change it via command in your host tty / primary OS
```sh
chown -R $USER:$USER home/
```
