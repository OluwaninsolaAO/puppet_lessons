# update apt repository

exec { 'apt-update':
  command => '/usr/bin/apt-get update'
}
