#!/bin/bash

app_env="$1"
app_path=/usr/src/beekids
image_web_name="kid_$1_web"
docker_compose_file="docker-compose-$1.yml"
docker_compose_cmd="docker-compose -f $docker_compose_file"

cd $app_path/devops
$docker_compose_cmd stop $image_web_name
$docker_compose_cmd up -d $image_web_name
