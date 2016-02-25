#!/bin/bash

NOW=$(date '+%d/%m/%Y %H:%M:%S')
PRETEXT="${SERVICE} | ${NOW}"
TEXT="Deployment ${STATUS} of ${SERVICE} with ${IMAGE} container in the ${CLUSTER} environment"

if [ "${STATUS}" = "completed" ]; then
   COLOR="good"
else
   COLOR="bad"
fi

/usr/bin/curl \
    -X POST \
    -s \
    --data-urlencode "payload={ \
        \"channel\": \"$SLACK_CHANNEL\", \
        \"username\": \"Deployment ECS ${CLUSTER}\", \
        \"color\": \"${COLOR}\", \
        \"icon_emoji\": \":soon:\", \
        \"text\": \"${TEXT}\" \
    }" \
    $SLACK_URL
