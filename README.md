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
| Debian | Debian  | Jessie    | [![x86_64](http://img.shields.io/badge/x86_64-passed-006400.svg?style=flat)](x) |
| Debian | Ubuntu  | Precise   | [![x86_64](http://img.shields.io/badge/x86_64-passed-006400.svg?style=flat)](x) |
| Debian | Ubuntu  | Yakkety   | [![x86_64](http://img.shields.io/badge/x86_64-passed-006400.svg?style=flat)](x) |
| Debian | Ubuntu  | Xenial    | [![x86_64](http://img.shields.io/badge/x86_64-passed-006400.svg?style=flat)](x) |
| Debian | Ubuntu  | Trusty    | [![x86_64](http://img.shields.io/badge/x86_64-passed-006400.svg?style=flat)](x) |
| Debian | Ubuntu  | Vivid     | [![x86_64](http://img.shields.io/badge/x86_64-passed-006400.svg?style=flat)](x) |
| Debian | Ubuntu  | Wily      | [![x86_64](http://img.shields.io/badge/x86_64-passed-006400.svg?style=flat)](x) |
| Debian | Ubuntu  | Artful    | [![x86_64](http://img.shields.io/badge/x86_64-passed-006400.svg?style=flat)](x) |
| Debian | Ubuntu  | Bionic    | [![x86_64](http://img.shields.io/badge/x86_64-passed-006400.svg?style=flat)](x) |
| Debian | Ubuntu  | Cosmic    | [![x86_64](http://img.shields.io/badge/x86_64-passed-006400.svg?style=flat)](x) |
| RedHat | Centos  | 7         | [![x86_64](http://img.shields.io/badge/x86_64-passed-006400.svg?style=flat)](x) |

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

- **oracle_java_cache_valid_time**: the amount of time in seconds the apt cache is valid (default: `3600`).
- **oracle_java_apt_repository**: Personal Package Archive (PPA) from where to install Java (default: `http://ppa.launchpad.net/webupd8team/java/ubuntu {{ ansible_distribution | lower }} main`).
- **oracle_java_apt_repository_key**: PPA repository key (default: `0xC2518248EEA14886`).
- **oracle_java_state**:** the package state (see Ansible apt module for more information).
- **oracle_java_home**: the location of the Java home directory (default: `/usr/lib/jvm/java-10-oracle`).

### Redhat-only

- **oracle_java_dir_source**: directory where to store the RPM files (default: `/usr/local/src`).
- **oracle_java_rpm_filename**: file name used for the download destination (default: `jdk-10.0.2_linux-x64_bin.rpm`).
- **oracle_java_home**: the location of the Java home directory (default: `/usr/java/default`).
- **oracle_java_download_url**: where to download the rpm from (default: `http://download.oracle.com/otn-pub/java/jdk/10.0.2+13/19aef61b38124481863b1413dce1855f/jdk-10.0.2_linux-x64_bin.rpm`).
- **oracle_java_download_timeout**: download timeout, in seconds (default: `60`).
- **oracle_java_rpm_validate_certs**: flag to indicate if you want SSL certificate validation (default: `yes`).

## Playbooks

```yaml
# generic
- hosts: servers
  roles:
      - role: ansiblebit.oracle-java


# debian | Java 8
- hosts: servers
  roles:
      - role: ansiblebit.oracle-java
        oracle_java_apt_repository: "http://ppa.launchpad.net/webupd8team/java/ubuntu {{ ansible_distribution | lower }} main"
        oracle_java_apt_repository_key: '0xC2518248EEA14886'

# debian | Java 10
- hosts: servers
  roles:
      - role: ansiblebit.oracle-java
        oracle_java_apt_repository: "http://ppa.launchpad.net/linuxuprising/java/ubuntu {{ ansible_distribution | lower }} main"
        oracle_java_apt_repository_key: '0xC2518248EEA14886'

# debian | ubuntu | Java 8
- hosts: servers
  roles:
      - role: ansiblebit.oracle-java
        oracle_java_apt_repository: "ppa:webupd8team/java {{ ansible_distribution | lower }} main"

# debian | ubuntu | Java 10
- hosts: servers
  roles:
      - role: ansiblebit.oracle-java
```

Use `--skip-tags=debug` if you want to suppress debug information.

## Test

```bash
tox -e py27-ansible26 -- --box centos7-64.vagrant.dev

tox -e py27-ansible26 -- --box bionic64.vagrant.dev
```

## Links

- [launchpad > WebUpd8 > Oracle Java (JDK) 8 / 9 Installer PPA](https://launchpad.net/~webupd8team/+archive/ubuntu/java)
- [launchpad > Linux Uprising > Oracle Java](https://launchpad.net/~linuxuprising/+archive/ubuntu/java)
