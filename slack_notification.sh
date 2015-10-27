#!/bin/bash

NOW=$(date '+%d/%m/%Y %H:%M:%S')
PRETEXT="${SERVICE} | ${NOW}"
ENVIRONMENT=${ENVIRONMENT}
TEXT="Deployment completed of ${SERVICE} with ${IMAGE} container in the ${ENVIRONMENT} environment"

/usr/bin/curl \
    -X POST \
    -s \
    --data-urlencode "payload={ \
        \"channel\": \"$SLACK_CHANNEL\", \
        \"username\": \"Deployment ECS ${ENVIRONMENT}\", \
        \"pretext\": \"${PRETEXT}\", \
        \"color\": \"good\", \
        \"icon_emoji\": \":soon:\", \
        \"text\": \"${TEXT}\" \
    }" \
    $SLACK_URL
