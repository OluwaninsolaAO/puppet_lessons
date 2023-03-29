# Learning Puppet

This Git repository contains the code, configuration files, and
documentation I created while learning Puppet, a widely used
configuration management tool.
The repository includes examples and exercises, such as Puppet
manifests, modules, and other resources I created while exploring
the different features and functionalities of Puppet.


### Purpose
The purpose of this repository is to document my Puppet learning
journey and provide a helpful resource for anyone looking to
learn Puppet.


### Install `puppet`
```
$ sudo apt-get update
$ sudo apt-get install -y ruby
$ sudo apt-get install -y ruby-augeas
$ sudo apt-get install -y ruby-shadow
$ sudo apt-get install -y puppet
```


### Install `puppet-lint`
```
$ sudo gem install puppet-lint
```


### Basic construct of a puppet manifest

Following are some of the relevant Puppet terminology and concepts.

__Resources__: Puppet code is composed primarily of resource
declarations. A resource describes something about the state of the
system, such as a certain user or file should exist, or a package
should be installed. Resource declarations are formatted as follows:

```
resource_type { 'resource_name'
  attribute => value,
  ...
}
```


__Manifests__: Puppet programs are called manifests. Manifests are
composed of puppet code and their filenames use the `.pp` extension.


__Classes__: In Puppet, classes are code blocks that can be called
in a code elsewhere, and have the ability to take in arguments just like
any other language methods or functions. Using classes allows you reuse
Puppet code, and can make reading manifests easier. Here is how a class
definition is formatted:

```
class example_class {
  ...
  code
  ...
}
```

> Learn more ['click here'](https://www.puppet.com/docs/puppet/6/lang_resources.html)


### Puppet Resources with examples
Puppet is a configuration management tool that allows system
administrators to automate the deployment and management of
infrastructure. Puppet uses resources to define the state of a
system, and it provides a large number of resource types for
managing various aspects of a system. Here are some of the most
commonly used puppet resources and examples of how they are used:


#### File Resource
The file resource is used to manage files on a system. It can be used
to create, modify, or delete files.

Example:
```
file { '/etc/motd':
  content => "Welcome to my system!\n",
  owner   => 'root',
  group   => 'root',
  mode    => '0644',
}
```
> This example creates a file called 'motd' in the /etc directory
with the content "Welcome to my system!" and sets the owner to root,
group to root, and mode to 0644.



#### Package Resource
The package resource is used to manage packages on a system. It can be
used to install, upgrade, or remove packages.

Example:
```
package { 'nginx':
  ensure => installed,
}
```
> This example installs the `nginx` package on the system.



#### Service Resource
The service resource is used to manage services on a system. It can be
used to start, stop, restart, or enable/disable services.

Example:
```
service { 'nginx':
  ensure    => running,
  enable    => true,
  subscribe => File['/etc/nginx/nginx.conf'],
}
```
> This example ensures that the nginx service is running and enabled,
and it subscribes to changes in the `/etc/nginx/nginx.conf` file resource.



#### User Resource
The user resource is used to manage users on a system. It can be used to
create, modify, or delete users.

Example:
```
user { 'john':
  ensure     => present,
  uid        => '1001',
  gid        => 'users',
  shell      => '/bin/bash',
  home       => '/home/john',
  managehome => true,
}
```
> This example creates a user `john` with a specific UID, group ID,
shell, and home directory.



#### Group Resource
The group resource is used to manage groups on a system. It can be used
to create, modify, or delete groups.

Example:
```
group { 'users':
  ensure => present,
}
```
> This example creates a group `users`.



#### Exec Resource
The exec resource is used to run arbitrary commands on a system. It can
be used to execute scripts, install software manually or make changes
that are not handled by a pre-built resource.

Example:
```
exec { 'update-system':
  command     => '/usr/bin/apt-get update',
  refreshonly => true,
}
```
> This example runs the command `/usr/bin/apt-get` update when the resource
is refreshed, which means it will only run when another resource needs to be
refreshed or executed.



These are just a few of the many resources available in Puppet, and they
demonstrate the power and flexibility of the tool. By using these resources
and others, system administrators can automate the management of their
infrastructure, reduce errors, and improve efficiency.
