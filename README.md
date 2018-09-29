# shellinabox

Tested with Travis CI

[![Build Status](https://travis-ci.com/bodgit/puppet-shellinabox.svg?branch=master)](https://travis-ci.com/bodgit/puppet-shellinabox)
[![Coverage Status](https://coveralls.io/repos/bodgit/puppet-shellinabox/badge.svg?branch=master&service=github)](https://coveralls.io/github/bodgit/puppet-shellinabox?branch=master)
[![Puppet Forge](http://img.shields.io/puppetforge/v/bodgit/shellinabox.svg)](https://forge.puppetlabs.com/bodgit/shellinabox)

#### Table of Contents

1. [Description](#description)
2. [Setup - The basics of getting started with shellinabox](#setup)
    * [Setup requirements](#setup-requirements)
    * [Beginning with shellinabox](#beginning-with-shellinabox)
3. [Usage - Configuration options and additional functionality](#usage)
4. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Description

This module installs and manages ShellInABox.

RHEL/CentOS is supported using Puppet 4.9.0 or later.

## Setup

### Setup Requirements

On RHEL/CentOS platforms you will need to have access to the EPEL repository by
using [stahnma/epel](https://forge.puppet.com/stahnma/epel) or by other means.

### Beginning with shellinabox

In the very simplest case, you can just include the following:

```puppet
include ::shellinabox
```

## Usage

To run an SSH instance listening on localhost-only suitable for using with a reverse proxy:

```puppet
class { '::shellinabox':
  disable_ssl      => true,
  disable_ssl_menu => true,
  localhost_only   => true,
  services         => {
    '/' => 'SSH',
  },
}
```

## Reference

The reference documentation is generated with
[puppet-strings](https://github.com/puppetlabs/puppet-strings) and the latest
version of the documentation is hosted at
[https://bodgit.github.io/puppet-shellinabox/](https://bodgit.github.io/puppet-shellinabox/).

## Limitations

This module has been built on and tested against Puppet 4.9.0 and higher.

The module has been tested on:

* CentOS/Red Hat Enterprise Linux 6/7

## Development

The module has both [rspec-puppet](http://rspec-puppet.com) and
[beaker-rspec](https://github.com/puppetlabs/beaker-rspec) tests. Run them
with:

```
$ bundle exec rake test
$ PUPPET_INSTALL_TYPE=agent PUPPET_INSTALL_VERSION=x.y.z bundle exec rake beaker:<nodeset>
```

Please log issues or pull requests at
[github](https://github.com/bodgit/puppet-shellinabox).
