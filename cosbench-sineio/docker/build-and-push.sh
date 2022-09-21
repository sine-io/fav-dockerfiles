#!/bin/bash


source ./.env


if [ ! -f cosbench-$VERSION-sineio.tar.gz  ]
then
	echo "Get cosbench-${VERSION}-sineio.tar.gz from github"
	wget https://github.com/sine-io/cosbench-sineio/releases/download/$VERSION/cosbench-$VERSION-sineio.tar.gz
	echo "Done"
fi


echo "Build docker image of ubuntu..."
docker build -t sineio/cosbench-sineio:$VERSION-ubuntu -f Dockerfile-ubuntu . --build-arg COS_VERSION=$VERSION
echo "Done"

echo "Build docker image of alpine..."
docker build -t sineio/cosbench-sineio:$VERSION-alpine -f Dockerfile-alpine . --build-arg COS_VERSION=$VERSION
echo "Done"

echo "Push to the Docker Hub"
docker push sineio/cosbench-sineio:$VERSION-ubuntu
docker push sineio/cosbench-sineio:$VERSION-alpine

echo "Done"

rm -f ./cosbench-$VERSION-sineio.tar.gz
