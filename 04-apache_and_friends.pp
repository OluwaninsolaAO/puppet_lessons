# Install apache2 while creating a simple html file.

# update apt repository
exec { 'apt-update':
  command => '/usr/bin/apt-get update',
}

# install nginx if not installed
package { 'nginx':
  require => Exec['apt-update'],
  ensure  => installed,
}

# stop nginx
service { 'nginx':
  require => Package['nginx'],
  ensure  => stopped,
}

# install apache2 if not installed
package { 'apache2':
  require => Exec['apt-update'],
  ensure  => installed,
}

# ensure apache2 service is running
service { 'apache2':
  require => Package['apache2'],
  ensure  => running,
}

# create an index html
file { '/var/www/html/index.html':
  ensure  => file,
  content => '<h1> Hello Apache and friends 🚀!</h1>',
}
