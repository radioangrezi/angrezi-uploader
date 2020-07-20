#!/bin/sh
# run as angrezi user

# remove all files
rm -rf /var/angrezi/angrezi-uploader/{*,.*}

# copy new files
cp -a /var/github/actions-runner/angrezi-uploader/angrezi-uploader/dist/. /var/angrezi/angrezi-uploader

# restart apache vhost?

