#!/bin/bash

set -e

podman pod rm crate -f || true

podman pull --authfile=$HOME/.secret/auth.json docker.io/redis && \
sleep 3 && \
podman pull --authfile=$HOME/.secret/auth.json docker.io/postgres:15-alpine && \
sleep 3 && \
podman pull --authfile=$HOME/.secret/auth.json registry.adathor.com/crate/crate:latest && \
sleep 3 && \
podman pull --authfile=$HOME/.secret/auth.json registry.adathor.com/crate/crate-nginx
sleep 3 && \
podman pod create --name crate -p 8888:80 && \
sleep 3 && \
podman run -d --pod crate --authfile=$HOME/.secret/auth.json --name crate-redis --label io.containers.autoupdate=image docker.io/redis && \
sleep 3 && \
podman run -d --pod crate -v crate_db:/var/lib/postgresql/data:z --name crate-db -e POSTGRES_USER=synopses0935 -e POSTGRES_PASSWORD=pRPPjG2S4TqGnrg7B45tMPpSm62XaSUq3kckoSrvjyQ3vezqsQg6gS4YhdYGv98HsqFK7xUjLGCQGM9jDKQbeCr4X9DAAQxM docker.io/postgres:15-alpine && \
sleep 3 && \
podman run -d --pod crate --authfile=$HOME/.secret/auth.json --name crate-app --label io.containers.autoupdate=image -v crate-www:/var/www/html:z -v /home/podman_vol/crate/data/osc:/var/www/html/data registry.adathor.com/crate/crate:latest && \
sleep 3 && \
podman run -d --pod crate --authfile=$HOME/.secret/auth.json --name crate-www --label io.containers.autoupdate=image --volumes-from crate-app:ro registry.adathor.com/crate/crate-nginx
