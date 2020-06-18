#!/bin/bash

set -e

# Figure out which branch we're on
branch=$(git rev-parse --abbrev-ref HEAD)

if [[ "$branch" == "release" ]]; then
	# If we're on release branch, we'll tag the image with the package version.
	# NOTE: we should also tag with the git rev but I'm being lazy for now.
	version=$(node -e 'console.log(require("./package.json").version)')
else
	# If we're on any other branch, tag with the git revision.
	version=$(git rev-parse HEAD)
fi
image=deployment_app_1
repo=gcr.io/sandbox-20200610-98rxvk

docker build -t $image:$version .
docker tag  $image:$version $repo/$image:$version
docker push $repo/$image:$version
