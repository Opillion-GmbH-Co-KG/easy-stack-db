ARG PROD_IMAGE_TAG
ARG DOCKER_REPO_NAME=opillion
FROM ${DOCKER_REPO_NAME}/redis:${PROD_IMAGE_TAG}
