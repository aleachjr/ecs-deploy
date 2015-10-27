#!/bin/bash

NOW=$(date '+%d/%m/%Y %H:%M:%S')
PRETEXT="${SERVICE} | ${NOW}"
TEXT="Deployment completed of ${SERVICE} with ${IMAGE} container in the ${CLUSTER} environment"

/usr/bin/curl \
    -X POST \
    -s \
    --data-urlencode "payload={ \
        \"channel\": \"$SLACK_CHANNEL\", \
        \"username\": \"Deployment ECS ${CLUSTER}\", \
        \"pretext\": \"${PRETEXT}\", \
        \"color\": \"good\", \
        \"icon_emoji\": \":soon:\", \
        \"text\": \"${TEXT}\" \
    }" \
    $SLACK_URL
