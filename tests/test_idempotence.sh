#!/usr/bin/env bash
# #################
#
# Bash script to run idempotence tests.
#
# version: 1.0
#
# mandatory variables:
#
#   from environment.sh
#   - INVENTORY : the inventory to be used to run the test against.
#   - PLAYBOOK : the path to the Ansible playbook.
#
#   from <playbook_name>.sh
#   - box : the name of the vagrant box
#
# optional variables:
#
#   - VIRTUALENV_NAME : the name of the virtualenv being used.
#
# author(s):
#   - Pedro Salgado <steenzout@ymail.com>
#
# #################


# GREEN : SGR code to set text color (foreground) to green.
GREEN='\033[0;32m'
# RED : SGR code to set text color (foreground) to red.
RED='\033[0;31m'
# SGR code to set text color (foreground) to no color.
NC='\033[0m'

echo "[INFO] $VIRTUALENV_NAME running idempotence test..."
ansible-playbook -i ${INVENTORY} --limit ${box} ${PLAYBOOK}
ansible-playbook -i ${INVENTORY} --limit ${box} ${PLAYBOOK} | \
    grep "${box}" | grep -q "${PASS_CRITERIA}" && \
    echo -ne "[TEST] $VIRTUALENV_NAME idempotence : ${GREEN}PASS${NC}\n" || \
    (echo -ne "[TEST] $VIRTUALENV_NAME idempotence : ${RED}FAILED${NC} ${PASS_CRITERIA}\n" && exit 1)
