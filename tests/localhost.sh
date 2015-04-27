#!/usr/bin/env bash
# #################
#
# Bash script to run the test suite against the localhost.
#
# WARNING: be sure path to ansible-playbook command line tool is included in $PATH!
#
# version: 1.0
#
# usage:
#
#   bash localhost.sh
#
# author(s):
#   - Pedro Salgado <steenzout@ymail.com>
#
# #################

DIR="$(dirname "$0")"

cd $DIR

source ${DIR}/environment.sh


. install_role_dependencies.sh


INVENTORY="localhost,"
PLAYBOOK="localhost.yml"
VIRTUALENV_NAME="localhost"

. test_idempotence.sh
