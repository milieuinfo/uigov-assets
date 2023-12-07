#!/bin/bash

# use this script by running it with `. ./build-and-release.sh`
#  -> or make it eXecutable

# to publish the .tgz on artifactory
#  -> remove the 'domg-' prefix
#  -> login on https://repo.omgeving.vlaanderen.be
#  -> 'deploy' to repository 'local-npm' with target path '@domg/govflanders-font'

# release the package
#cd dist/src/lib
npm pack
#cd ../../..
