# swagger-generator


## Usage in pipeline
tbd
## Usage locally
### Prerequisites
  - Docker
### Steps
 - Build image using `Dockerfile` (e.g. `docker_build.sh`)
 - Run image with env variables and volumes described below, e.g.:
   - `source env/spinner.env`
   - `docker_run.sh`

Example usage in project's `package.json`:
"@closerplatform/spinner": "/Users/.../swagger/build",

## Image Env Variables
| Name | Function | Example |
| ---- | -------- | ------- |
| YAML_FILE_PATH | Path to definitions file, depends on where the volume was mounted | /resources/closerAPI.yaml
| PROJECT_NAME | Name of project, used when naming package.json | spinner |
| PROJECT_VERSION | Version of project, used in package.json | 1.0.0 |
| SHOULD_PUBLISH |  |

## Image volumes
| Type | Example | Function |
| ---- | ------ | -------- |
| Required | -v $YAML_FILE_DIRECTORY:/resources:ro | make directory with definitions file accessible in container |
| Optional | -v $PWD/build:/swagger/build | link built output |

## Generator options
[Codegen 3.0](https://github.com/swagger-api/swagger-codegen/tree/3.0.0)

 - `npmName`
 - `npmVersion`
 - `supportsES6`
 - `modelPropertyNaming`
