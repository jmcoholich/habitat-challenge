#!/usr/bin/env bash

DOCKER_NAME="rearrange_submission"

while [[ $# -gt 0 ]]
do
key="${1}"

case $key in
      --docker-name)
      shift
      DOCKER_NAME="${1}"
	  shift
      ;;
    *) # unknown arg
      echo unkown arg ${1}
      exit
      ;;
esac
done

docker run \
    -v $(realpath data/versioned_data):/data/versioned_data \
    --runtime=nvidia \
    -e "AGENT_EVALUATION_TYPE=local" \
    -e "TRACK_CONFIG_FILE=/configs/tasks/rearrange_easy.local.rgbd.yaml" \
    ${DOCKER_NAME}\

