# ansiblebit.oracle-java

[![License](https://img.shields.io/badge/license-New%20BSD-blue.svg?style=flat)](https://raw.githubusercontent.com/ansiblebit/oracle-java/master/LICENSE)
[![Build Status](https://travis-ci.org/ansiblebit/oracle-java.svg?branch=master)](https://travis-ci.org/ansiblebit/oracle-java)

[![Platform](http://img.shields.io/badge/platform-centos-932279.svg?style=flat)](#)
[![Platform](http://img.shields.io/badge/platform-debian-a80030.svg?style=flat)](#)
[![Platform](http://img.shields.io/badge/platform-redhat-cc0000.svg?style=flat)](#)
[![Platform](http://img.shields.io/badge/platform-ubuntu-dd4814.svg?style=flat)](#)

[![Project Stats](https://www.openhub.net/p/ansiblebit-oracle-java/widgets/project_thin_badge.gif)](https://www.openhub.net/p/ansiblebit-oracle-java/)

An [Ansible](http://www.ansible.com) role to setup Oracle Java Development Kit. 

DISCLAIMER: usage of any version of this role implies you have accepted the
[Oracle Binary Code License Agreement for Java SE](http://www.oracle.com/technetwork/java/javase/terms/license/index.html).


## Tests

| Family | Distribution | Version | Test Status |
|:-:|:-:|:-:|:-:|
| Debian | Debian  | Jessie    | [![x86_64](http://img.shields.io/badge/x86_64-passed-006400.svg?style=flat)](#) |
| Debian | Ubuntu  | Precise   | [![x86_64](http://img.shields.io/badge/x86_64-passed-006400.svg?style=flat)](#) |
| Debian | Ubuntu  | Yakkety   | [![x86_64](http://img.shields.io/badge/x86_64-passed-006400.svg?style=flat)](#) |
| Debian | Ubuntu  | Xenial    | [![x86_64](http://img.shields.io/badge/x86_64-passed-006400.svg?style=flat)](#) |
| Debian | Ubuntu  | Trusty    | [![x86_64](http://img.shields.io/badge/x86_64-passed-006400.svg?style=flat)](#) |
| Debian | Ubuntu  | Vivid     | [![x86_64](http://img.shields.io/badge/x86_64-passed-006400.svg?style=flat)](#) |
| Debian | Ubuntu  | Wily      | [![x86_64](http://img.shields.io/badge/x86_64-passed-006400.svg?style=flat)](#) |
| RedHat | Centos  | 7         | [![x86_64](http://img.shields.io/badge/x86_64-passed-006400.svg?style=flat)](#) |

## Requirements

- ansible == 1.9.x


# Facts
| variable | description |
|:-:|:--|
| oracle_java_installed         | fact set by this role that contains a flag that indicates if Java is installed on the host. |
| oracle_java_version_installed | fact set by this role that contains the string of the Java version installed in the system. |


## Role Variables

| variable | default | description |
|:--------:|:-------:|:------------|
| debug | undefined | flag to make role more verbose. |
| oracle_java_set_as_default | no | make the newly installed Java the default runtime environment. |
| oracle_java_state   | latest | the package state (see Ansible apt module for more information). |
| oracle_java_version | 8 | the Oracle JDK version to be installed. |
| oracle_java_version_update | 74 | the Oracle JDK version update. |
| oracle_java_version_build | 02 | the Oracle JDK version update build number. |
| oracle_java_version_string | 1.{{ oracle_java_version }}.0_u{{ oracle_java_version_update }} | the Java version string to verify installation against. |
| oracle_java_os_supported variable | - | role internal variable to check if a OS family is supported or not. | 


### Debian-only

| variable | default | description |
|:-:|:-:|:--|
| launchpad_ppa_webupd8_cache_valid_time | 3600 | the amount of time in seconds the apt cache is valid. |
| oracle_java_cache_valid_time | 3600 | the amount of time in seconds the apt cache is valid. |
| oracle_java_state   | latest | the package state (see Ansible apt module for more information). |
| oracle_java_home | /usr/lib/jvm/java-{{ oracle_java_version }}-oracle | the location of the Java home directory. |


### Redhat-only

| variable | default | description |
|:-:|:-:|:--|
| oracle_java_dir_source | /usr/local/src | directory where to store the RPM files. |
| oracle_java_home | /usr/java/jdk1.{{ oracle_java_version }}.0_{{ oracle_java_version_update }} | the location of the Java home directory. |
| oracle_java_rpm_filename | jdk-{{ oracle_java_version }}u{{ oracle_java_version_update }}-linux-x64.rpm | the filename of the RPM. |
| oracle_java_rpm_url | http://download.oracle.com/otn-pub/java/jdk/{{ oracle_java_version }}u{{ oracle_java_version_update }}-b{{ oracle_java_version_build }}/{{ oracle_java_rpm_filename }} | the URL where the RPM can be downloaded from. |


## Dependencies

For Debian and Ubuntu this role depends on:

- ansiblebit.launchpad-ppa-webupd8


## Playbooks

    - hosts: servers
      roles:
         - { role: ansiblebit.oracle-java,
             oracle_java_set_as_default: yes }

Use `--skip-tags=debug` if you want to suppress debug information.


## License

BSD


## Author Information

- [steenzout](http://github.com/steenzout)
