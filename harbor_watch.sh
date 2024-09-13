#!/bin/bash

# Variables
HARBOR_USER="user"
HARBOR_PW="admin1234"
URL="https://registry.adathor.com/api/v2.0/health"

# Run registry healthcheck
response=$(curl -s -w "%{http_code}" -o /dev/null -u "$HARBOR_USER:$HARBOR_PW" -H "Content-Type: application/json" -H "Accept: application/json" "$URL")

# Check if the response status code is 200 or 201
if [[ "$response" == "200" || "$response" == "201" ]]; then
  echo "Healthcheck passed"
else
  cd /data/Harbor/harbor && docker compose down && docker compose up -d
fi