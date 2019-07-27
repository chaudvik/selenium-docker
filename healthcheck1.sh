#!/usr/bin/env bash
# Environment Variables
# HUB_HOST
# BROWSER
# MODULE
echo "Checking if hub is ready - $HUB_HOST"
MY_VARIABLE=$( curl -s http://$HUB_HOST:4444/wd/hub/status | jq -r .value.ready )
echo "MY_VARIABLE value is: - $MY_VARIABLE"
# start the java command
java -cp selenium-docker.jar:selenium-docker-tests.jar:libs/* \
    -DHUB_HOST=hub \
    -DBROWSER=chrome \
    org.testng.TestNG $MODULE
