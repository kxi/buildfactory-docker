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
echo " Start Compile Maven Project"
echo "##############################################"
echo ""
mkdir docker/m2
docker run -ti --rm -v $(pwd):/source_code -v $(pwd)/docker/m2:/root/.m2 buildfactory/maven /source_code/docker/java_compile.sh
