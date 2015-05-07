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

| variable | default | description |
|:--------:|:-------:|:------------|
| oracle_java_version | 8 | the Oracle JDK version to be installed. |
| oracle_java_state   | latest | the package state (see Ansible apt module for more information). |
| oracle_java_default | no | make the newly installed Java the default runtime environment. |
| oracle_java_cache_valid_time | 3600 | the amount of time in seconds the apt cache is valid. |


## Dependencies

For Debian and Ubuntu this role depends on:

- ansiblebit.launchpad-ppa-webupd8


## Playbooks

    - hosts: servers
      roles:
         - { role: ansiblebit.oracle-java, oracle_java_default: yes }


## Changelog

- v3.0.0 : 7 May 2015
    - synchronized major version with primogen for easier reference
    - updated ansiblebit.launchpad-ppa-webupd8 == 3.0.0
    - merged primogen v3.0.4
- v1.0.4 : 5 May 2015
    - standardized tests with primogen v2.2.0
    - implementation of CentOS deployment
- v1.0.2 : 30 April 2015
    - added support for Ubuntu vivid
    - added support for Debian jessie
- v1.0.0 : 30 April 2015
    - initial release of this role with support for Debian
    - dependency on ansiblebit.launchpad-ppa-webupd8 v1.1.0
    - ansible dependency set to 1.8.4


## License

BSD


## Author Information

- [steenzout](http://github.com/steenzout)
