# Ensure Apache Web Server is running

service { 'apache2':
  ensure => running,
}
