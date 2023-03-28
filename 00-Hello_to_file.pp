# execute 'echo' to say 'Hello World'
exec { 'echo-hello':
  command => '/usr/bin/echo Hello_World > file'
}
