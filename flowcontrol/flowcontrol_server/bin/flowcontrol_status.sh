#!/bin/bash
variable=${1:-all}
if [ $variable = "all" ]; then
    IFS=$'\n'
    echo ""
    echo Lookup: all
    echo ""
    for key in $(jq -r '.status | keys[]' /data/data.json); do
        value=$(jq -r .status.$key.value /data/data.json)
        unit=$(jq -r .status.$key.unit /data/data.json)
        status=$(jq -r .status.$key.status /data/data.json)
        printf "> %-20s %-10s %-15s %s\n" "${key^}:" "$value" "$unit" "$status" 
    done
else 
    echo ""
    echo Lookup: $variable
    echo ""
    value=$(jq .status.$variable.value -r /data/data.json)
    unit=$(jq -r .status.$variable.unit /data/data.json)
    status=$(jq -r .status.$variable.status /data/data.json)
    printf "> %-20s %-10s %-15s %s\n" "${variable^}:" "$value" "$unit" "$status" 
fi

