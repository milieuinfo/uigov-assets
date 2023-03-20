#!/bin/bash

# use the script by running it with `. ./build.sh`
#  -> or make it eXecutable
#  -> running it with `bash build.sh` fails the `npx tsc` command

# clean the previous build
rm -rf dist
# prepare the build folder
mkdir -p dist/src/lib
mkdir -p dist/src/lib/common
mkdir -p dist/src/lib/component
mkdir -p dist/src/lib/element
# provide the package.json to publish - make sure it has the correct version
cp src/to-publish/package.json dist/src/lib
# provide the barrel files to publish
cp src/to-publish/common/index.ts dist/src/lib/common
cp src/to-publish/component/index.ts dist/src/lib/component
cp src/to-publish/element/index.ts dist/src/lib/element
# process the scss
npx sass src/lib:dist/src/lib --no-source-map --load-path ./node_modules
# wrap the css in a .ts file
node post-process-libs.mjs
# transpile the .ts files
npx tsc ./dist/**/*.ts --declaration --target es2019
# cleanup op the typescript source files
rm -rf ./dist/**/*.css.ts
rm -rf ./dist/**/index.ts
