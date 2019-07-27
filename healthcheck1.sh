#!/usr/bin/env bash
# Environment Variables
# HUB_HOST
# BROWSER
# MODULE
echo "Checking if hub is ready - $HUB_HOST"
java -cp selenium-docker.jar:selenium-docker-tests.jar:libs/* \
    -DHUB_HOST=$HUB_HOST \
    -DBROWSER=$BROWSER \
    org.testng.TestNG $MODULE
