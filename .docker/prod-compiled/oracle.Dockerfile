ARG PROD_IMAGE_TAG=latest
ARG DOCKER_REPO=opillion
FROM ${DOCKER_REPO}/oracle:${PROD_IMAGE_TAG}
