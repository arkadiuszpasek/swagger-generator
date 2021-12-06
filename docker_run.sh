docker run \
  -e YAML_FILE_PATH=/resources/$YAML_FILE \
  -v $YAML_FILE_DIR:/resources:ro \
  -v $PWD/dist:/openapi/dist \
  -v $PWD/src:/openapi/src \
  --rm \
  -i \
  openapi-generator
