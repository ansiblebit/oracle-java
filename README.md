# ansiblebit.oracle-java

[![License](https://img.shields.io/badge/license-New%20BSD-blue.svg?style=flat)](https://raw.githubusercontent.com/ansiblebit/oracle-java/master/LICENSE)
[![Build Status](https://travis-ci.org/ansiblebit/oracle-java.svg?branch=master)](https://travis-ci.org/ansiblebit/oracle-java)

[![Platform](http://img.shields.io/badge/platform-centos-932279.svg?style=flat)](CentOS)
[![Platform](http://img.shields.io/badge/platform-debian-a80030.svg?style=flat)](Debian)
[![Platform](http://img.shields.io/badge/platform-redhat-cc0000.svg?style=flat)](RedHat)
[![Platform](http://img.shields.io/badge/platform-ubuntu-dd4814.svg?style=flat)](Ubuntu)

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

- ansible >= 2.x

## Facts

- **oracle_java_installed**: fact set by this role that contains a flag that indicates if Java is installed on the host.
- **oracle_java_version_installed**: fact set by this role that contains the string of the Java version installed in the system.

## Role Variables

- **debug**: flag to make role more verbose.
- **oracle_java_set_as_default**: make the newly installed Java the default runtime environment (default: `yes`).
- **oracle_java_state**: the package state (see Ansible apt module for more information) (default: `latest`).
- **oracle_java_version**: the Oracle JDK version to be installed (default: `10`).
- **oracle_java_version_string**: the Java version string to verify installation against (default: `1.{{ oracle_java_version }}.0_u{{ oracle_java_version_update }}`).
- **oracle_java_os_supported**: role internal variable to check if a OS family is supported or not.

### Debian-only

- **oracle_java_apt_distribution**: (default: `trusty`).
- **oracle_java_cache_valid_time**: the amount of time in seconds the apt cache is valid (default: `3600`).
- **oracle_java_state**:** the package state (see Ansible apt module for more information).
- **oracle_java_home**: the location of the Java home directory (default: `/usr/lib/jvm/java-{{ oracle_java_version }}-oracle`).

### Redhat-only

- **oracle_java_dir_source**: directory where to store the RPM files (default: `/usr/local/src`).
- **oracle_java_home**: the location of the Java home directory (default: `/usr/java/jdk1.{{ oracle_java_version }}.0_{{ oracle_java_version_update }}`).
- **oracle_java_download_url**: where to download the rpm from.
- **oracle_java_rpm_validate_certs | yes | flag to indicate if you want SSL certificate validation (default: `yes`).

## Playbooks

    - hosts: servers
      roles:
         - role: ansiblebit.oracle-java
           oracle_java_set_as_default: yes

Use `--skip-tags=debug` if you want to suppress debug information.

## Test

```bash
tox -e py27-ansible26 -- --box centos7

tox -e py27-ansible26 -- --box bionic
```
