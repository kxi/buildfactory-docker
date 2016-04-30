#!/bin/bash

mvn --version
#cd /source_code/sample_maven_project/helloworld
#mvn clean validate compile

cd /source_code/sample_maven_project/gs-rest-service
mvn clean test
