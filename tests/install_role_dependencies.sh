#!/usr/bin/env bash

echo '[INFO] installing Ansible galaxy dependencies...'
# NOTE: the contents of this file must match the values of the dependencies key in the meta/main.yml file
ansible-galaxy install --ignore-errors --force -r ${REQUIREMENTS_FILE}
# NOTE : remove --ignore-errors when your requirements.yml file is not empty
