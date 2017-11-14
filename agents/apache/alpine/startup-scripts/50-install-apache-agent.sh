#!/usr/bin/env bash

APACHE_DIST=$(ls -1 /dists/appdynamics-sdk-native-nativeWebServer*)
NUM_DISTS=( $APACHE_DIST )
NUM_DISTS=${#NUM_DISTS[@]}

if [ ${NUM_DISTS} -gt 1 ]; then
    echo "Too many nativeWebServer dists in /dists: ${NUM_DISTS}"
    echo "${APACHE_DIST}"
    exit 1
elif [ ${NUM_DISTS} -lt 1 ]; then
    echo "No nativeWebServer dists in /dists: ${NUM_DISTS}"
    exit 1
fi

tar xvf ${APACHE_DIST} -C /opt

pushd /opt/appdynamics-sdk-native
./install.sh
mkdir /opt/appdynamics-sdk-native/appd-sdk

if [ "$APPD_CONTROLLER_HOST" = "" ]; then
    echo "Please set APPD_CONTROLLER_HOST"
    exit 1
fi

if [ "$APPD_CONTROLLER_PORT" = "" ]; then
    echo "Please set APPD_CONTROLLER_PORT"
    exit 1
fi

if [ "$APPD_USE_SSL" = "" ]; then
    echo "Please set APPD_USE_SSL"
    exit 1
fi


if [ "$APPD_ACCOUNT_NAME" = "" ]; then
    echo "Please set APPD_ACCOUNT_NAME"
    exit 1
fi

if [ "$APPD_ACCESS_KEY" = "" ]; then
    echo "Please set APPD_ACCESS_KEY"
    exit 1
fi

if [ "$APPD_APPLICATION" = "" ]; then
    echo "Please set APPD_APPLICATION"
    exit 1
fi

if [ "$APPD_TIER" = "" ]; then
    echo "Please set APPD_TIER"
    exit 1
fi

if [ "$APPD_NODE" = "" ]; then
    echo "Please set APPD_NODE"
    exit 1
fi


sed -e "s/APPD_CONTROLLER_HOST/${APPD_CONTROLLER_HOST}/" /opt/docker/etc/httpd/conf.d/99-appdynamics_agent.conf.tmpl | \
    sed -e "s/APPD_CONTROLLER_PORT/${APPD_CONTROLLER_PORT}/" | \
    sed -e "s/APPD_USE_SSL/${APPD_USE_SSL}/" | \
    sed -e "s/APPD_ACCOUNT_NAME/${APPD_ACCOUNT_NAME}/" | \
    sed -e "s/APPD_ACCESS_KEY/${APPD_ACCESS_KEY}/" | \
    sed -e "s/APPD_APPLICATION/${APPD_APPLICATION}/" | \
    sed -e "s/APPD_TIER/${APPD_TIER}/" | \
    sed -e "s/APPD_NODE/${APPD_NODE}/" > /opt/docker/etc/httpd/conf.d/99-appdynamics_agent.conf

cp /opt/docker/etc/httpd/conf.d/99-appdynamics_agent.conf /opt/appdynamics-sdk-native/logs


