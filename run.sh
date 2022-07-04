#!/bin/sh
COUNTER=1
while :; do
  clear
  echo "plan begins (run number: ${COUNTER})"
  terraform apply -auto-approve
  echo "plan ends (run number: ${COUNTER})"
  COUNTER=${COUNTER}+1
  sleep 60s
done
