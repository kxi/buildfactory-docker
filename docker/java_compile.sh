#!/bin/bash

mvn --version
cd /source_code/sample_maven_project/helloworld
mvn clean validate compile
