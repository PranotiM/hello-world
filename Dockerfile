FROM ubuntu:18.04

 

SHELL ["/bin/bash", "-c"]

 

# Update OS and Install required packages
RUN apt-get update
RUN apt-get install vim -y

 

# Git Install
RUN apt-get install --yes --no-install-recommends git 
RUN git --version 
RUN git config --global user.email "PranotiM@hexaware.com" 
RUN git config --global user.name "Pranoti"

 

# JDK Install
RUN apt-get install --yes --no-install-recommends openjdk-11-jdk 
RUN java -version

 

# Maven Install
RUN apt-get install --yes --no-install-recommends maven 
RUN mvn --version

 

# Jenkins userid
RUN useradd -m -s /bin/bash jenkins
