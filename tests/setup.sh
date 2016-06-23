#!/usr/bin/env bash
# #################
#
# Bash script to setup the test environment.
#
# version: 1.0
#
# usage:
#
#   setup.sh
#
# example:
#
#   bash setup.sh
#
# changelog:
#
#   v1.0 :  10 June 2016
#     - initial version
#
# author(s):
#   - Pedro Salgado <steenzout@ymail.com>
#
# #################

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

test -s ${DIR}/../requirements.yml \
    && ansible-galaxy install \
        --force \
        -r ${DIR}/../requirements.yml \
        --roles-path=${DIR}/dependencies \
    || true
