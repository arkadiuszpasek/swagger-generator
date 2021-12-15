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

echo "Generating $PROJECT_NAME@$PROJECT_VERSION: $YAML_FILE_PATH"
rm -f config.json
echo "{" >> config.json
echo "  \"npmName\": \"$PROJECT_NAME\"," >> config.json
echo "  \"npmVersion\": \"$PROJECT_VERSION\"," >> config.json
echo "  \"supportsES6\": true," >> config.json
echo "  \"modelPropertyNaming\": \"original\"" >> config.json
echo "}" >> config.json

java -jar swagger-codegen-cli.jar generate \
 -i $YAML_FILE_PATH \
 -l typescript-fetch \
 -o /swagger/build \
 -c /swagger/config.json

./post_process_unix.sh /swagger/build/api.ts
cp .npmignore build/
cd build/

echo "# $PROJECT_NAME - typescript sdk" > README.md
npm install

if [[ $SHOULD_PUBLISH = true ]]; then
  npm publish
else 
  echo "SHOULD_PUBLISH is not true, will not publish package";
  npm run build
fi