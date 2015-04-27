#!/usr/bin/env bash
# #################
#
# Bash script to run idempotence tests.
#
# version: 1.0
#
# mandatory variables:
#
#   - INVENTORY : the inventory to be used to run the test against.
#   - PLAYBOOK : the path to the Ansible playbook.
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

echo '[INFO] $VIRTUALENV_NAME running idempotence test...'
ansible-playbook -i ${INVENTORY} ${PLAYBOOK} | \
    grep -q "${PASS_CRITERIA}" && \
    echo -ne "[TEST] $VIRTUALENV_NAME idempotence : ${GREEN}PASS${NC}\n" || \
    (echo -ne "[TEST] $VIRTUALENV_NAME idempotence : ${RED}FAILED${NC} ${PASS_CRITERIA}\n" && exit 1)
