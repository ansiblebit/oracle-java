#!/usr/bin/env bash
# #################
#
# Bash script to run tests in the travis-ci environment.
#
# version: 1.0
#
# usage:
#
#   travis.sh
#
# example:
#
#   bash travis.sh
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

test $USER != 'travis' && exit 0

set -e

ansible-playbook \
    -i localhost, \
    --connection=local test.yml \
    -e vagrant_box=localhost \
    -e env=travis \
    --skip-tags=test \
    $@ \
&& bash test_checkmode.sh \
    --env travis \
&& bash test_idempotence.sh \
    --env travis

