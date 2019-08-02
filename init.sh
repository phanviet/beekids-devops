#!/bin/bash

BACKEND_LANDINGPAGE_REPO=git@github.com:phanviet/bk-backend-landingpage.git
BACKEND_SHOP_REPO=git@github.com:phanviet/kid.git
FRONTEND_LANDINGPAGE_REPO=git@github.com:phanviet/beekids-landingpage.git
CURRENT_DIR=$(pwd)

init_repo () {
  if [ ! -d "$1" ]
  then
    git clone $2 $1
  fi
}

# Clone backend repos
cd ..
mkdir -p backend && cd backend
init_repo "shop" $BACKEND_SHOP_REPO
init_repo "landingpage" $BACKEND_LANDINGPAGE_REPO

# Clone frontend repos
cd ..
mkdir -p frontend && cd frontend
init_repo "landingpage" $FRONTEND_LANDINGPAGE_REPO

cd $CURRENT_DIR
