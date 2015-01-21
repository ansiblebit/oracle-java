#!/bin/bash

GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'


# syntax test
OUTPUT=`ansible-playbook --syntax-check -i inventory/local test.yml 2>&1`
RETURN_CODE=$?
if [[ $RETURN_CODE != 0 ]]; then
  echo -ne "Syntax test: ${RED}FAIL${NC}\n"
  echo $OUTPUT
  exit $RETURN_CODE
else
  echo -ne "Syntax test: ${GREEN}PASS${NC}\n"
fi


# playbook run test

ansible-playbook -i inventory/local test.yml
RETURN_CODE=$?
if [[ $RETURN_CODE != 0 ]]; then
  echo -ne "Playbook run test: ${RED}PASS${NC}\n"
  exit $RETURN_CODE
else
  echo -ne "Playbook run test: ${GREEN}PASS${NC}\n"
fi


# playbook idempotency test

ansible-playbook -i inventory/local test.yml | \
    grep -q 'changed=0.*failed=0' && \
    (echo -ne "Idempotence test: ${GREEN}PASS${NC}\n" && exit 0) || \
    (echo -ne "Idempotence test: ${RED}FAIL${NC}\n" && exit 1)

