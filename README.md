# GitBook Server

![](gitbook_and_docker.png)

## Introduction

Docker-gitbook-server allows you to run gitbook without installing NodeJS or Gitbook CLI. All you need is Docker.

The [container](https://hub.docker.com/r/beeronbeard/docker-gitbook-server/) is based on the Node 7.5 base image.

## Usage

Clone your gitbook project in `/home/yourname/yourbook` or anywhere, then run this command.

```
docker run -d -p 4000:4000 -v /home/yourname/yourbook:/data beeronbeard/docker-gitbook-server
```

## SELINUX Error

On Fedora or any Linux computer with SELINUX as your Docker Server: 
If you get run `docker logs container_name` and the log appears like 
```
Press CTRL+C to quit ...

Live reload server started on port: 35729
Starting build ...
EACCES, open '/gitbook/README.md'
```

It is most likely caused by the SELINUX settings restricting the container from accessing the folder. To add a rule to allow the container access to yourbook folder as root run:
 
```
chcon -Rt svirt_sandbox_file_t /home/yourname/yourbook/
```

You should be able to start the container.
Kensel found the answer to this problem [Here] (http://stackoverflow.com/questions/24288616/permission-denied-on-accessing-host-directory-in-docker)
