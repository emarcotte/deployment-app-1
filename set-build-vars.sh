#!/bin/bash
echo '##[warning] Running setup tool'

# This script exists to expose some variables to azure pipelines from the repo
# https://docs.microsoft.com/en-us/azure/devops/pipelines/process/variables?view=azure-devops&tabs=yaml%2Cbatch
# Figure out which branch we're on
branch=`git rev-parse --abbrev-ref HEAD`

if [[ "$branch" == "release" ]]; then
	# If we're on release branch, we'll tag the image with the package version.
	# NOTE: we should also tag with the git rev but I'm being lazy for now.
	version=`node -e 'console.log(require("./package.json").version)'`
else
	# If we're on any other branch, tag with the git revision.
	version=`git rev-parse HEAD`
fi

echo "##vso[task.setvariable variable=image_version]"$version

