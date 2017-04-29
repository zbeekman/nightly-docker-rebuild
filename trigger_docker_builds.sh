#!/usr/bin/env bash
#
# Script to trigger nightly builds on Docker Hub using Travis-CI
#
# Iterates over encrypted Travis-CI variables named `DH_END_POINT*`
# containing docker hub web hook endpoint URLs including the secret
# token and sends '{"build": true}' POSTs to the URL.
#
# Copyright (c) 2016, Izaak Beekman
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#
# * Redistributions of source code must retain the above copyright notice, this
#   list of conditions and the following disclaimer.
#
# * Redistributions in binary form must reproduce the above copyright notice,
#   this list of conditions and the following disclaimer in the documentation
#   and/or other materials provided with the distribution.
#
# * Neither the name of the copyright holder nor the names of its
#   contributors may be used to endorse or promote products derived from
#   this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
# DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
# FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
# DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
# SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
# CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
# OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
# OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

# set -o verbose
set -o pipefail
set -o nounset
set -o errexit

# Make sure you create encrypted variables `DH_END_POINT_1`,
# `DH_END_POINT_2` ... `DH_END_POINT_<N>` for each docker build you
# want to trigger These end point URLs have your secret token in them
# so make sure to use:
#   `travis env set DH_END_POINT_1 https://registry.hub.docker.com/u/<USER>/<REPO>/trigger/<TOKEN>/`

for DH_URL_W_TOKEN in ${!DH_END_POINT*}; do
  time curl -H "Content-Type: application/json" --data '{"build": true}' -X POST "${!DH_URL_W_TOKEN}" \
    && echo "Sent request to rebuild ${DH_URL_W_TOKEN%/*/}"
done

# other examples
# # Trigger by docker tag name
# $ curl -H "Content-Type: application/json" --data '{"docker_tag": "master"}' -X POST $DH_URL_W_TOKEN
# # Trigger by Source branch named staging
# $ curl -H "Content-Type: application/json" --data '{"source_type": "Branch", "source_name": "staging"}' -X POST $DH_URL_W_TOKEN
# # Trigger by Source tag named v1.1
# $ curl -H "Content-Type: application/json" --data '{"source_type": "Tag", "source_name": "v1.1"}' -X POST $DH_URL_W_TOKEN
