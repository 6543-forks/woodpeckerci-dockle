#!/bin/bash

set -e

if [ -z ${PLUGIN_EXIT_CODE} ]; then
  PLUGIN_EXIT_CODE=1
fi

if [ -z ${PLUGIN_EXIT_LEVEL} ]; then
  PLUGIN_EXIT_LEVEL='warn'
fi

if [ -z ${PLUGIN_BUILD_DIRECTORY} ]; then
  PLUGIN_BUILD_DIRECTORY=${CI_WORKSPACE}
fi

if [ ! -z ${PLUGIN_DOCKLE_IGNORES} ]; then
  export DOCKLE_IGNORES=${PLUGIN_DOCKLE_IGNORES}
fi

docker build -t dockle-ci-test:${CI_COMMIT_SHA} ${PLUGIN_BUILD_DIRECTORY}

dockle --exit-code ${PLUGIN_EXIT_CODE} --exit-level ${PLUGIN_EXIT_LEVEL} dockle-ci-test:${CI_COMMIT_SHA}
