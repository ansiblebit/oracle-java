# ansiblebit.oracle-java

[![License](https://img.shields.io/badge/license-New%20BSD-blue.svg?style=flat)](https://raw.githubusercontent.com/ansiblebit/oracle-java/master/LICENSE)
[![Build Status](https://travis-ci.org/ansiblebit/oracle-java.svg?branch=master)](https://travis-ci.org/ansiblebit/oracle-java)

[![Platform](http://img.shields.io/badge/platforms-debian-a80030.svg?style=flat)](#)
[![Platform](http://img.shields.io/badge/platforms-ubuntu-dd4814.svg?style=flat)](#)

[![Project Stats](https://www.openhub.net/p/ansiblebit-oracle-java/widgets/project_thin_badge.gif)](https://www.openhub.net/p/ansiblebit-oracle-java/)

An [Ansible](http://www.ansible.com) role to setup Oracle Java Development Kit. 


## Requirements

- ansible >= 1.8.4


## Role Variables


oracle_java_version | 8 | the Oracle JDK version to be installed. |
oracle_java_state   | latest | the package state (see Ansible apt module for more information). |
oracle_java_default | no | make the newly installed Java the default runtime environment. |


## Dependencies

For Debian and Ubuntu this role depends on:

- ansiblebit.launchpad-ppa-webupd8


## Playbooks

    - hosts: servers
      roles:
         - { role: ansiblebit.oracle-java, oracle_java_default: yes }

## Changelog

- v0.0.8 : 30 April 2015
    - initial release of this role with support for Debian
    - dependency on ansiblebit.launchpad-ppa-webupd8 v1.1.0
    - ansible dependency set to 1.8.4


## Links


## License

BSD


## Author Information

- [steenzout](http://github.com/steenzout)
