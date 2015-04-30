#!/usr/bin/env bash
# #################
#
# Bash script to run the test suite against the Vagrant environment.
#
# version: 1.0
#
# usage:
#
#   $ bash vagrant.sh --python 27 --ansible 1901
#
#   $ bash vagrant.sh --virtualenv ../.tox/py27-ansible1901 --virtualenv-name py27-ansible1901
#
# author(s):
#   - Pedro Salgado <steenzout@ymail.com>
#
# #################

DIR="$(dirname "$0")"

cd $DIR

source environment.sh

# The filename of the Ansible playbook to be used on the test.
# NOTE: PLAYBOOK must be the same value as defined in the Vagrantfile.
PLAYBOOK="vagrant.yml"

# Inventory file to run tests againt (points to Vagrant generated inventory)
INVENTORY=${DIR}/.vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory


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

        --virtualenv-name)
        # The tox virtualenv name
        VIRTUALENV_NAME="$2"
        shift;;

        --virtualenv)
        # The virtualenv directory to be used on the test.
        VIRTUALENV="$2"
        shift;;

        *)
        # unknown option
        ;;

    esac
    shift
done

if [[ ! -z ${PYTHON_VERSION} ]] && [[ ! -z ${ANSIBLE_VERSION} ]]; then
    echo '[INFO] loading Python / Ansible virtualenv...'
    VIRTUALENV="../.tox/py${PYTHON_VERSION}-ansible${ANSIBLE_VERSION}"
    VIRTUALENV_NAME="py${PYTHON_VERSION}-ansible${ANSIBLE_VERSION}"
fi

source ${VIRTUALENV}/bin/activate


. install_role_dependencies.sh

# force Ansible to ask for sudo password when running tests against Vagrant
export ANSIBLE_ASK_SUDO_PASS=True

for BOX in `grep vagrant.dev group_vars/all.yml | sed 's/://g'`
do

    echo "[INFO] preparing ${BOX}..."
    vagrant up ${BOX} 2> /dev/null
    if [ $? -ne 0 ]; then
        # box not enabled
        continue
    fi

    . test_idempotence.sh

    echo "[INFO] destroy ${BOX}..."
    vagrant destroy -f ${BOX}
done
