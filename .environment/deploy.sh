#!/bin/bash

# accessible var DEPLOY_REPO_NAME
# accessible var DEPLOY_DEST
# accessible var DEPLOY_FROM

# run as angrezi user
SERVICE_USER=www-data

# remove all files
sudo rm -rf "$DEPLOY_DEST"
sudo mkdir "$DEPLOY_DEST"

# copy application files
sudo cp -R "$DEPLOY_FROM"/dist/. "$DEPLOY_DEST"

# chown by user
sudo chown -R $SERVICE_USER:$SERVICE_USER "$DEPLOY_DEST"
# restart apache vhost?
