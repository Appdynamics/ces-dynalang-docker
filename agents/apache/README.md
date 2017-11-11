# Apache Agent Docker Container

This container allows for dropping in an apache agent tarball and specifying the various parameters using environment variables. On run it will install and configure the agent with the parameters supplied and then start apache.

### Mounts (dst):

* /dists - The directory containing the agent tarball.
* /opt/appdynamics-sdk-native/logs - Expose the agent logs directory.
* /app - The apache document root.

### Ports:

* 80, 443 - Apache ports.

### Env Vars:

* APPD_CONTROLLER_HOST
* APPD_CONTROLLER_PORT
* APPD_USE_SLL
* APPD_ACCOUNT_NAME
* APPD_ACCESS_KEY
* APPD_APPLICATION
* APPD_TIER
* APPD_NODE

### Example run script:

run.sh

```
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
```

### To Use:

1. clone this repo.
2. cd ces-dynalang-docker/agents/apache.
3. edit run.sh with your controller/node params
4. run run.sh

### TODO

1. Add http proxy settings.
2. Modify run.sh to use variable for settings and host mount paths.
