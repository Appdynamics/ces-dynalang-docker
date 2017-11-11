#!/usr/bin/env bash

DIR=$(PWD)
docker run --name apache-agent \
    --mount type=bind,src=${DIR}/dists,dst=/dists \
    --mount type=bind,src=${DIR}/logs,dst=/opt/appdynamics-sdk-native/logs \
    --mount type=bind,src=${DIR}/html,dst=/app \
    -p 8180:80 \
    -e APPD_CONTROLLER_HOST="localhost" \
    -e APPD_CONTROLLER_PORT="8090" \
    -e APPD_USE_SSL="NO" \
    -e APPD_ACCOUNT_NAME="customer1" \
    -e APPD_ACCESS_KEY="347575848" \
    -e APPD_APPLICATION="MyApp" \
    -e APPD_TIER="Tier1" \
    -e APPD_NODE="node1" \
    --rm brennanmhappd/apache-agent:latest
