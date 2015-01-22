#!/bin/bash

PYTHON_VERSION=27
ANSIBLE_VERSION=182

GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

DIR="$(dirname "$0")"

cd $DIR

source ../.tox/py${PYTHON_VERSION}-ansible${ANSIBLE_VERSION}/bin/activate

for box in precise64 trusty64
do
    vagrant up $box
    
    ansible-playbook -i inventory/vagrant -l $box.vagrant.dev test.yml
    RETURN_CODE=$?
    if [[ $RETURN_CODE != 0 ]]; then
      echo -ne "Playbook run test: ${RED}PASS${NC}\n"
      exit $RETURN_CODE
    else
      echo -ne "Playbook run test: ${GREEN}PASS${NC}\n"
    fi

    ansible-playbook -i inventory/vagrant -l $box.vagrant.dev test.yml | \
        grep -q 'changed=0.*failed=0' && \
        echo -ne "[$box] idempotence test: ${GREEN}PASS${NC}\n" || \
        (echo -ne "[$box] idempotence test: ${RED}FAIL${NC}\n" && exit 1)

    vagrant destroy -f $box
done
