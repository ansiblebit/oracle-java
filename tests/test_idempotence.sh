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
#   - BOX : the name of the vagrant box
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
# the logfile to hold the output of the playbook run
LOGFILE="log/${BOX}_${VIRTUALENV_NAME}.log"

echo "[INFO] #{BOX} ${VIRTUALENV_NAME} running idempotence test..."
ansible-playbook -i ${INVENTORY} --limit ${BOX} ${PLAYBOOK} 2>&1 | tee ${LOGFILE} | \
    grep "${BOX}" | grep -q "${PASS_CRITERIA}" && \
    echo -ne "[TEST] ${BOX} ${VIRTUALENV_NAME} idempotence : ${GREEN}PASS${NC}\n" || \
    (echo -ne "[TEST] ${BOX} ${VIRTUALENV_NAME} idempotence : ${RED}FAILED${NC} ${PASS_CRITERIA}\n" && exit 1)
