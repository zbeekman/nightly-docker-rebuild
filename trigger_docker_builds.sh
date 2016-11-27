#!/usr/env bash

set -o verbose
set -o pipefail
set -o nounset
set -o errexit

# Make sure you create encrypted variables DH_END_POINT_1, DH_END_POINT_2 ... DH_END_POINT_N for each docker build you want to trigger
# These end point URLs have your secret token in them so make sure to use:
#    `travis env set DH_END_POINT_1 https://registry.hub.docker.com/u/<USER>/<REPO>/trigger/<TOKEN>/`

for DH_URL_W_TOKEN in ${!DH_END_POINT*} ; do
  curl -H "Content-Type: application/json" --data '{"build": true}' -X POST $DH_URL_W_TOKEN
done


# other examples
# # Trigger by docker tag name
# $ curl -H "Content-Type: application/json" --data '{"docker_tag": "master"}' -X POST $DH_URL_W_TOKEN
# # Trigger by Source branch named staging
# $ curl -H "Content-Type: application/json" --data '{"source_type": "Branch", "source_name": "staging"}' -X POST $DH_URL_W_TOKEN
# # Trigger by Source tag named v1.1
# $ curl -H "Content-Type: application/json" --data '{"source_type": "Tag", "source_name": "v1.1"}' -X POST $DH_URL_W_TOKEN

