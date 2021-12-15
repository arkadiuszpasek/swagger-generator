docker run \
  -e YAML_FILE_PATH=/resources/$YAML_FILE \
  -e SHOULD_PUBLISH=$SHOULD_PUBLISH \
  -e PROJECT_NAME=$PROJECT_NAME \
  -e PROJECT_VERSION=$PROJECT_VERSION \
  -v $YAML_FILE_DIR:/resources:ro \
  -v $PWD/build:/swagger/build \
  --rm \
  -i \
  swagger-generator
