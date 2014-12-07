#!/bin/bash

GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

ansible-playbook --syntax-check -i inventory/local test.yml
ansible-playbook -i inventory/local test.yml
ansible-playbook -i inventory/local test.yml | \
    grep -q 'changed=0.*failed=0' && \
    (echo -ne "Idempotence test: ${GREEN}PASS${NC}\n" && exit 0) || \
    (echo -ne "Idempotence test: ${RED}FAIL${NC}\n" && exit 1)

