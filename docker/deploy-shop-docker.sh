#!/bin/bash

app_env="$1"
app_path=/usr/src/beekids
image_app_name="kid_$1_app"
image_web_name="kid_$1_web"
image_db_name="kid_$1_db"
docker_compose_file="docker-compose-$1.yml"
docker_compose_cmd="docker-compose -f $docker_compose_file"

cd $app_path/devops
$docker_compose_cmd exec $image_app_name bundle install
$docker_compose_cmd exec $image_app_name bundle exec rails db:migrate
$docker_compose_cmd exec $image_app_name bundle exec rails assets:precompile
$docker_compose_cmd stop $image_app_name $image_web_name
$docker_compose_cmd up -d $image_app_name $image_web_name
