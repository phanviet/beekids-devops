#!/bin/bash

app_env="$1"
app_path=/usr/src/beekids
image_app_name="bk_landingpage_$1_api"
image_db_name="bk_landingpage_$1_db"
image_web_name="kid_$1_web"
docker_compose_file="docker-compose-$1.yml"
docker_compose_cmd="docker-compose -f $docker_compose_file"

cd $app_path
$docker_compose_cmd exec $image_app_name npm install
$docker_compose_cmd stop $image_app_name $image_web_name
$docker_compose_cmd up -d $image_app_name $image_web_name
