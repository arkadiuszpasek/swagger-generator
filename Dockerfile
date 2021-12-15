FROM node:14.5.0-alpine3.12
# RUN apk update && apk add bash
RUN apk add openjdk11

WORKDIR /swagger
RUN wget https://repo1.maven.org/maven2/io/swagger/codegen/v3/swagger-codegen-cli/3.0.30/swagger-codegen-cli-3.0.30.jar -O swagger-codegen-cli.jar

COPY utils/post_process_unix.sh .
COPY utils/build.sh .

CMD ["/bin/sh", "-c", "./build.sh"]
#CMD ["build.sh"]
