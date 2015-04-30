# ansiblebit.oracle-java

[![Build Status](https://travis-ci.org/ansiblebit/oracle-java.svg?branch=master)](https://travis-ci.org/ansiblebit/oracle-java)
[![License](https://img.shields.io/badge/license-New%20BSD-blue.svg?style=flat)](https://raw.githubusercontent.com/ansiblebit/oracle-java/master/LICENSE)

[![Project Stats](https://www.openhub.net/p/ansiblebit-oracle-java/widgets/project_thin_badge.gif)](https://www.openhub.net/p/ansiblebit-oracle-java/)

An [Ansible](http://www.ansible.com) role to setup Oracle Java Development Kit. 


## Requirements

- ansible >= 1.7.2


## Role Variables


oracle_java_version | 8 | the Oracle JDK version to be installed. |
oracle_java_state   | latest | the package state (see Ansible apt module for more information). |
oracle_java_default | no | make the newly installed Java the default runtime environment. |


## Dependencies

For Debian and Ubuntu this role depends on:

- ansiblebit.launchpad-ppa-webupd8

<<<<<<< HEAD
=======
## Playbooks
>>>>>>> 8474690162d1072e9f1839c4e11cb5033a534e94

## Example Playbook

    - hosts: servers
      roles:
         - { role: ansiblebit.oracle-java, oracle_java_default: yes }

## Changelog

- v0.0.8 : 30 April 2015
    - initial release of this role with support for Debian

## Links


## License

BSD

## Author Information

- [steenzout](http://github.com/steenzout)
