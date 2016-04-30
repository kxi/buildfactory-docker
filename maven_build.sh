#:/bin/bash
echo ""
echo "##############################################"
echo " Start Build Docker Image"
echo "##############################################"
echo ""
docker build --tag="buildfactory/maven" docker

echo ""
echo ""
echo "##############################################"
echo " Start Maven Project"
echo "##############################################"
echo ""
mkdir docker/m2
if [[ "$1" == "debug" ]]
then
  echo "##############################################"
  echo " Start Maven Debug Mode"
  echo "##############################################"
  docker run -ti --rm -v $(pwd):/source_code -v $(pwd)/docker/m2:/root/.m2 -p 1080:8080 buildfactory/maven /source_code/docker/java_debug.sh
elif [[ "$1" == "test" ]]
then
  echo "##############################################"
  echo " Start Maven Unit Test"
  echo "##############################################"
  docker run -ti --rm -v $(pwd):/source_code -v $(pwd)/docker/m2:/root/.m2 -p 1080:8080 buildfactory/maven /source_code/docker/java_test.sh
else
  echo "##############################################"
  echo " Start Maven Compile Mode"
  echo "##############################################"
  docker run -ti --rm -v $(pwd):/source_code -v $(pwd)/docker/m2:/root/.m2 -p 1080:8080 buildfactory/maven /source_code/docker/java_compile.sh
fi


