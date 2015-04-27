#!/usr/bin/env bash

echo '[INFO] installing Ansible galaxy dependencies...'
# NOTE: the contents of this file must match the values of the dependencies key in the meta/main.yml file
cat ${REQUIREMENTS_FILE} | xargs -I {} ansible-galaxy --force install {}
