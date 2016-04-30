FROM centos:6.7
ENV MAVEN_VERSION 3.3.3
WORKDIR /tmp

# Install System Packages
RUN yum update -y
RUN yum install -y wget vim tar

# Install Java
RUN yum install -y java-1.7.0-openjdk java-1.7.0-openjdk-devel

# Install Maven
RUN curl -O https://archive.apache.org/dist/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz && tar zxf apache-maven-3.3.3-bin.tar.gz && mv apache-maven-3.3.3 /usr/share/ && ln -s /usr/share/apache-maven-${MAVEN_VERSION}/bin/mvn /usr/bin/mvn

# Make Maven .m2 Local Repo
RUN mkdir /root/.m2
VOLUME /root/.m2

# Create Source Code Directory 
RUN mkdir /source_code
VOLUME /source_code
