#!/bin/sh

apachectl -D FOREGROUND &

REPO=/var/www/html/repo
while inotifywait -r -e close_write -e move -e create -e delete ${REPO}; do
    dpkg-scanpackages -t deb ${REPO} /dev/null > ${REPO}/Packages
    dpkg-scanpackages -t ddeb ${REPO} /dev/null >> ${REPO}/Packages
done