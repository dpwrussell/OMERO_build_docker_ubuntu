FROM ubuntu
MAINTAINER Douglas Russell <douglas_russell@hms.harvard.edu>

ENV DOCKER_VERSION 1.9.1-0~trusty

LABEL Description="This image is used to build OMERO Development artifacts" Version="0.1"
RUN apt-get update && apt-get install -y git python python-setuptools python-pip openjdk-8-jdk zeroc-ice35 apt-transport-https ca-certificates
RUN pip install awscli

# Install Docker from Docker Inc. repositories.
RUN apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
RUN echo "deb https://apt.dockerproject.org/repo ubuntu-xenial main" > /etc/apt/sources.list.d/docker.list
# TODO Need this?
# RUN apt-get update && apt-get install linux-image-extra-$(uname -r) linux-image-extra-virtual
RUN apt-get update && apt-get install -y docker-engine=$DOCKER_VERSION && rm -rf /var/lib/apt/lists/*
