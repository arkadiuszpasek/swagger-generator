FROM node:14.5.0-alpine3.12
RUN apk add openjdk11

WORKDIR /swagger
RUN wget https://repo1.maven.org/maven2/io/swagger/codegen/v3/swagger-codegen-cli/3.0.30/swagger-codegen-cli-3.0.30.jar -O swagger-codegen-cli.jar

COPY utils/post_process_unix.sh .
COPY config.json .

CMD java -jar swagger-codegen-cli.jar generate \
 -i $YAML_FILE_PATH \
 -l typescript-fetch \
 -o /swagger/build \
 -c config.json \
 && ./post_process_unix.sh /swagger/build/api.ts \
 && cd build/ \
 && npm install \
 && npm run build
