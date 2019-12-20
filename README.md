# python-chef

[![Build Status](https://travis-ci.org/hansohn/python-chef.svg?branch=master)](https://travis-ci.org/hansohn/python-chef) [![GitHub tag](https://img.shields.io/github/tag/hansohn/python-chef.svg)](https://github.com/hansohn/python-chef)

This cookbook installs [Python](https://www.python.org/) a object-oriented, interpreted, and interactive programming language.

### Prerequsites

This cookbook utilizes the [yum-ius](https://supermarket.chef.io/cookbooks/yum-ius) cookbook to setup both the [EPEL](https://fedoraproject.org/wiki/EPEL) and [IUS](https://ius.io/) yum repos. Depending on your package requirements you may or may not need to include this cookbook in your recipe.

### Usage

#### Step 1: Berksfile

Update berksfile to include the cookbook from github

```ruby
# add cookbook from github
cookbook "python-chef", "~> 0.2.0", git: "https://github.com/hansohn/python-chef.git"
```

#### Step 2: Metadata.rb

Update metadata.rb to include cookbook dependency

```ruby
# include cookbook dependency
depends 'python-chef'
```

#### Step 3: Include Cookbook

This cookbook contains `python2`, `python3`, and `virtualenv` recipes which function independently of each other. Include only the ones you need.

```ruby
# include python2 recipe
include_recipe "python-chef::python2"

# include python3 recipe
include_recipe "python-chef::python3"

# include virtualenv recipe
include_recipe "python-chef::virtualenv"
```

#### Step 4: Define Attributes

Define the python packages, pips, and virtualenvs that you would like this recipe to install.

##### Python2

```ruby
# python2
default['python'] = {
  'python2' => {
    'packages' => [
      'python-devel',
      'python2-pip',
      'python-setuptools',
    ],
    'bin' => '/bin/python2',
    'pip_bin' => '/bin/pip2',
    'easy_install_bin' => '/bin/easy_install-2.7',
    'pips' => [],
    'easy_installs' => [],
    'symlinks' => {}
  },
}
```

##### Python3

```ruby
# python 3
default['python'] = {
  'python3' => {
    'packages' => [
      'python36u-devel',
      'python36u-pip',
      'python36u-setuptools',
    ],
    'bin' => '/bin/python3.6',
    'pip_bin' => '/bin/pip3.6',
    'easy_install_bin' => '/bin/easy_install-3.6',
    'pips' => [],
    'easy_installs' => [],
    'symlinks' => {
      '/bin/python3' => 'python3.6',
      '/usr/bin/python3' => 'python3.6',
    },
  },
}
```

##### Virtualenv

```ruby
# virtualenv
default['python'] = {
  'virtualenvs' => {
    'python2' => {
      'python' => '/bin/python2',
      'dest_dir' => '/opt/virtualenv/python2',
      'pips' => [],
    },
    'python3' => {
      'python' => '/bin/python3.6',
      'dest_dir' => '/opt/virtualenv/python2',
      'pips' => [],
    },
  },
}
```
