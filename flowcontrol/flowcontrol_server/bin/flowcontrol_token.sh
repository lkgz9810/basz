#!/bin/bash
username=$1
password=$2

if [[ -z $username ]] || [[ -z $password ]]; then 
    echo "";
    echo "> ACCESS DENIED";
    exit 1
fi

correct_password=$(jq -r .users.$username /data/data.json)
access_token=$(jq -r .tokens.remote_access_token /data/data.json)
access_token_key_filename=${access_token#"TOKEN-"}.key

if [[ $correct_password == $password ]]; then 
    echo "";
    echo "> $access_token";
    echo "";
    echo "Key: $(</data/$access_token_key_filename)";
else
    echo "";
    echo "> ACCESS DENIED";
fi
