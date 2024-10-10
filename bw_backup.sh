#!/bin/bash

set -e

export NODE_NO_WARNINGS=1
source $HOME/Vaults/Knox/bw.env
bw login --apikey
bw unlock --passwordenv BW_ADATHOR | grep export | awk '{ print ( $2, $3) }' > bw.session
source bw.session
bw export --format json --output $HOME/Vaults/Knox/vault_backup.json
bw logout
echo "Bitwarden vault backup is completed"

