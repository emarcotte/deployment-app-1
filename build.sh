#!/bin/bash

version=$1
image=deployment_app_1
repo=gcr.io/sandbox-20200610-98rxvk

docker build -t $image:$version .
docker tag  $image:$version $repo/$image:$version
docker push $repo/$image:$version
