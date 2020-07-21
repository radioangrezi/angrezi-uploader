#!/bin/bash
# run as angrezi user
REPO_NAME=angrezi-uploader
DIST=/opt/services/$REPO_NAME/run
SERVICE_USER=www-data
# remove all files
sudo rm -rf $DIST
sudo mkdir $DIST

# copy application files
sudo cp -R /var/github/actions-runner/_work/$REPO_NAME/$REPO_NAME/dist/* $DIST/

# chown by user
sudo chown -R $SERVICE_USER:$SERVICE_USER $DIST
# restart apache vhost?
