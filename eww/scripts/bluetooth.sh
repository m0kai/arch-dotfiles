#!/bin/bash

# following command will dump the rfkill output as json, then parse it to pull out the bluetooth's status.
# blocked means bluetooth is off, unblocked means bluetooth is on
export STATUS=$(rfkill --json | jq '.[] | .[0] | .soft')

if [[ $STATUS == '"unblocked"' ]]; then
  echo "on"
elif [[ $STATUS == '"blocked"' ]]; then
  echo "off"
else
  echo "error"
fi
