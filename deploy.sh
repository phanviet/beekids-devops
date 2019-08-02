#!/bin/bash

# ANSIBLE_CONFIG_PATH=backend/ansible

# cd $ANSIBLE_CONFIG_PATH
# ansible-playbook -i hosts main.yml -v

app_env="$1"
scope="$2"
image_app_name="kid_$1_app"
image_web_name="kid_$1_web"
image_db_name="kid_$1_db"
docker_compose_file="docker-compose-$1.yml"
docker_compose_cmd="docker-compose -f $docker_compose_file"

app_path=/usr/src/beekids
devops_path=$app_path/devops

if [[ $app_env == "stag" ]]; then
  branch='develop'
  server='root@103.90.234.83'
  port='7878'
else
  branch='develop'
  server=''
  port='22'
fi

if [[ $scope == "shop" ]]; then
ssh -tt "$server" -p $port /bin/bash << EOF
  cd $app_path/backend/shop && git pull origin $branch && \
  cd $devops_path && git pull origin master && \
  ./docker/deploy-$scope-docker.sh $app_env && \
  exit
EOF
elif [[ $scope == "fe-landingpage" ]]; then
ssh -tt "$server" -p $port /bin/bash << EOF
  cd $app_path/frontend/landingpage && git pull origin $branch && \
  cd $devops_path && git pull origin master && \
  ./docker/deploy-$scope-docker.sh $app_env && \
  exit
EOF
fi
