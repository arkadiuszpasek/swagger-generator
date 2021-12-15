# swagger-generator


## Usage in pipeline
tbd
## Usage locally
### Prerequisites
  - Docker
### Steps
 1. Build image using `Dockerfile` (e.g. `docker_build.sh`)
 2. Export env variables described below (e.g. `source env/spinner.env`)
 3. Run built image in container (e.g. `docker_run.sh`)
 4. Package will be built in `build/`

Example usage in project's `package.json`:
"@closerplatform/spinner": "/Users/.../swagger/build",

## Image Env Variables
| Name | Function | Example |
| ---- | -------- | ------- |
| YAML_FILE_DIR | Path to directory which definitions file is in | /Users/resources
| YAML_FILE | Name on definitions file | closerAPI.yaml
| PROJECT_NAME | Name of project, used when naming package.json | spinner |
| PROJECT_VERSION | Version of project, used in package.json | 1.0.0 |
| SHOULD_PUBLISH |  |
