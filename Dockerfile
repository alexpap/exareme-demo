# set ubuntu as the base image
FROM ubuntu:14.04

MAINTAINER "Alexandros Papadopoulos" alpap@di.uoa.gr

WORKDIR /root/

# add repositories
RUN sudo apt-get -y install software-properties-common
RUN sudo add-apt-repository -y ppa:webupd8team/java
RUN sudo apt-get -y update

# accept oracle license
RUN echo debconf shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections

# install exareme dependencies
RUN sudo apt-get -y install python python-apsw
RUN sudo apt-get -y install oracle-java7-installer

# install exareme build dependencies
RUN sudo apt-get -y install git maven

# clone, build, configure
RUN git clone https://github.com/alexpap/exareme.git exareme-src
WORKDIR /root/exareme-src
RUN mvn clean install -DskipTests
RUN ln -s /root/exareme-src/exareme-distribution/target/exareme* /root/exareme
RUN ls -l /root/exareme/
RUN echo "examaster" > /root/exareme/etc/exareme/master

WORKDIR /root/exareme/

