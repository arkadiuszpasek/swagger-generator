#!/bin/sh

set -e

if [[ -z ${PROJECT_NAME} ]]; then
  echo '$PROJECT_NAME not set' ; exit 1
fi
if [[ -z ${PROJECT_VERSION} ]]; then
  echo '$PROJECT_VERSION not set' ; exit 1
fi
if [[ -z ${YAML_FILE_PATH} ]]; then
  echo '$YAML_FILE_PATH not set' ; exit 1
fi

java -jar swagger-codegen-cli.jar generate \
 -i $YAML_FILE_PATH \
 -l typescript-fetch \
 -o /swagger/build \
 -DnpmName=$PROJECT_NAME \
 -DnpmVersion=$PROJECT_VERSION \
 -DsupportsES6=true \
 -DmodelPropertyNaming="original"

./post_process_unix.sh /swagger/build/api.ts
cd build/

npm install
npm run build

if [[ $SHOULD_PUBLISH = true ]]; then
  npm publish
else 
  echo "SHOULD_PUBLISH is not true, will not publish package";
fi