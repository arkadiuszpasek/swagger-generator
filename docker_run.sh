docker run \
  -e YAML_FILE_PATH=/resources/$YAML_FILE \
  -v $YAML_FILE_DIR:/resources:ro \
  -v $PWD/build:/swagger/build \
  --rm \
  -i \
  swagger-generator
