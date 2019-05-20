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
| Debian | Debian  | Stretch   | [![x86_64](http://img.shields.io/badge/x86_64-passed-006400.svg?style=flat)](x) |
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
- **oracle_java_set_as_default**: flag to indicate if this play should set Java as default (default: `yes`).
- **oracle_java_use_defaults**: flag to indicate you want to use defaults set in the `defaults` directory (default: `yes`).
  **WARNING**. setting this to `no` will require the user to pass all of the distribution variables.
  See `* | Java 11` examples in the _Playbooks_ section.

### Debian

**WARNING** to override **any** of the following variables (even if it's only one),
you'll need to set `oracle_java_use_defaults: no` and override **all** of their values since
OS family defaults will no longer be loaded.
See `debian | Java 11` example in the _Playbooks_ section.

- **oracle_java_apt_repository**: Personal Package Archive (PPA) from where to install Java.
- **oracle_java_apt_repository_key**: PPA repository key.
- **oracle_java_cache_valid_time**: the amount of time in seconds the apt cache is valid.
- **oracle_java_deb_package**: name of debian package.
- **oracle_java_debconf_package_default**: name of debconf package to set default.
- **oracle_java_home**: the location of the Java home directory.
- **oracle_java_state**:** the package state (see Ansible apt module for more information).

### Debian/Ubuntu

**WARNING** to override **any** of the following variables (even if it's only one),
you'll need to set `oracle_java_use_defaults: no` and override **all** of their values since
OS family defaults will no longer be loaded.
See `debian | ubuntu | Java 11` example in the _Playbooks_ section.

- **oracle_java_apt_repository**: Personal Package Archive (PPA) from where to install Java.
- **oracle_java_cache_valid_time**: the amount of time in seconds the apt cache is valid.
- **oracle_java_deb_package**: name of debian package.
- **oracle_java_debconf_package_default**: name of debconf package to set default.
- **oracle_java_home**: the location of the Java home directory.
- **oracle_java_license_version**: which Oracle license version you will be accepting.
- **oracle_java_state**:** the package state (see Ansible apt module for more information).

### Redhat-only

**WARNING** to override **any** of the following variables (even if it's only one),
you'll need to set `oracle_java_use_defaults: no` and override **all** of their values since
OS family defaults will no longer be loaded.
See `redhat | centos 7 | Java 11` example in the _Playbooks_ section.

- **oracle_java_dir_source**: directory where to store the RPM files.
- **oracle_java_download_timeout**: download timeout, in seconds.
- **oracle_java_home**: the location of the Java home directory.
- **oracle_java_rpm_filename**: file name used for the download destination.
- **oracle_java_rpm_url**: where to download the rpm from.
- **oracle_java_rpm_validate_certs**: flag to indicate if you want SSL certificate validation.
- **oracle_java_version_string**: the Java version string to verify installation against.

## Playbooks

```yaml
# generic
- hosts: servers
  roles:
    - role: ansiblebit.oracle-java

# debian | Java 12
- hosts: servers
  roles:
    - role: ansiblebit.oracle-java

# debian | Java 11
- hosts: servers
  roles:
    - role: ansiblebit.oracle-java
      oracle_java_deb_package: 'oracle-java11-installer'
      oracle_java_debconf_package_default: 'oracle-java11-set-default'
      oracle_java_home: "/usr/lib/jvm/java-11-oracle"

## explicitely passing default parameters
- hosts: servers
  roles:
    - role: ansiblebit.oracle-java

# debian | ubuntu | Java 12
- hosts: servers
  roles:
    - role: ansiblebit.oracle-java

# debian | ubuntu | Java 11
- hosts: servers
  roles:
    - role: ansiblebit.oracle-java
      oracle_java_deb_package: 'oracle-java11-installer'
      oracle_java_debconf_package_default: 'oracle-java11-set-default'
      oracle_java_home: "/usr/lib/jvm/java-11-oracle"

# redhat | centos 7 | Java 12
- hosts: servers
  roles:
    - role: ansiblebit.oracle-java

# redhat | centos 7 | Java 11
- hosts: servers
  roles:
    - role: ansiblebit.oracle-java
      oracle_java_use_defaults: no
      oracle_java_dir_source: '/usr/local/src'
      oracle_java_download_timeout: 60
      oracle_java_rpm_filename: 'jdk-11.0.3_linux-x64_bin.rpm'
      oracle_java_home: '/usr/java/default'
      oracle_java_os_supported: yes
      oracle_java_rpm_url: 'https://download.oracle.com/otn/java/jdk/11.0.3+12/37f5e150db5247ab9333b11c1dddcd30/jdk-11.0.3_linux-x64_bin.rpm'
      oracle_java_rpm_validate_certs: yes
      oracle_java_set_as_default: no
      oracle_java_version_string: 11.0.3
```

Use `--skip-tags=debug` if you want to suppress debug information.

```bash
## Test

```bash
tox -e py27-ansible26 -- --box centos7-64.vagrant.dev

tox -e py27-ansible26 -- --box bionic64.vagrant.dev

# manual
source .tox/py27-ansible26/bin/activate
cd tests
vagrant up bionic64.vagrant.dev

bash test_idempotence.sh \
  --box bionic64.vagrant.dev \
  --inventory .vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory

## look at idempotence test logs
less log/bionic64.vagrant.dev_idempotence_py27-ansible26.log

## debug
vagrant ssh bionic64.vagrant.dev

bash test_checkmode.sh \
  --box bionic64.vagrant.dev \
  --inventory .vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory

## look at checkmode test logs
less log/bionic64.vagrant.dev_checkmode_py27-ansible26.log

vagrant destroy bionic64.vagrant.dev
```

## Links

- [launchpad > Linux Uprising > Oracle Java](https://launchpad.net/~linuxuprising/+archive/ubuntu/java)
