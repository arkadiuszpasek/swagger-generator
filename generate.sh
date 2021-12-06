docker run -v $PWD:/local -v $YAML_FILE_DIR:/local/resources --rm \
    swaggerapi/swagger-codegen-cli-v3:3.0.30 \
    generate \
    -i /local/resources/$YAML_FILE \
    -l typescript-fetch \
    -o /local/src
