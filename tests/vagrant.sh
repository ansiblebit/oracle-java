#!/usr/bin/env bash
# #################
#
# Bash script to run the Vagrant test suite.
#
# version: 1.0
#
# usage:
#
#   bash vagrant.sh
#
#   (in case you want to use one of tox virtualenvs)
#   bash vagrant.sh --python 27 --ansible 184
#
# author(s):
#   - Pedro Salgado <steenzout@ymail.com>
#
# #################

DIR="$(dirname "$0")"

cd $DIR

source ${DIR}/environment.sh

while [[ $# > 1 ]]
do
key="$1"

    case $key in

        --python)
        # The Python version to be used on the test.
        # NOTE: PYTHON_VERSION must be set to a Python version defined in tox.
        PYTHON_VERSION="$2"
        shift;;

        --ansible)
        # The Ansible version to be used on the test.
        # ANSIBLE_VERSION must be set to a Ansible version defined in tox.
        ANSIBLE_VERSION="$2"
        shift;;

        *)
        # unknown option
        ;;

    esac
    shift
done

DIR=$(dirname "$0")

if [[ ! -z ${PYTHON_VERSION} ]] && [[ ! -z ${ANSIBLE_VERSION} ]]; then
    echo '[INFO] loading Python / Ansible virtualenv...'
    source ${DIR}/../.tox/py${PYTHON_VERSION}-ansible${ANSIBLE_VERSION}/bin/activate
fi

echo '[INFO] installing Ansible galaxy dependencies...'
# NOTE: the contents of this file must match the values of the dependencies key in the meta/main.yml file
cat ${DIR}/requirements.txt | xargs -I {} ansible-galaxy --force install {}


for box_yml in ${DIR}/host_vars/*.yml
do
    filename=$(basename "$box_yml")
    box=${filename%.*}

    echo "[INFO] preparing ${box}..."
    vagrant up ${box}

    echo '[INFO] running idempotence test...'
    ansible-playbook -i ${INVENTORY} -l ${box} ${PLAYBOOK} | \
        grep -q "${PASS_CRITERIA}" && \
        echo -ne "[$box] idempotence test: ${GREEN}PASS${NC}\n" || \
        (echo -ne "[$box] idempotence test: ${RED}FAILED${NC}\n" && exit 1)
    echo "[INFO] pass criteria is ${PASS_CRITERIA}."

    echo "[INFO] destroying ${box}..."
    vagrant destroy -f $box
done
