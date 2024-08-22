# File: 7=puppe install nginx web server.pp
# Author: Alvin Elumeze 
# Email: <alvinchibundo007@gmail.com>


# Using Puppet| InstallNginx server


package { 'nginx':
  ensure => 'installed'
}

file {'var/www/html/index.html':
  content => 'Hello World',
}

file_line { 'redirection-301':
  ensure => 'present',
  path => '/etc/nginx/sites-availabe/default',
  after => 'listen 80 default_server;',
  line => 'rewrite ^/redirect_me https://www.youtube.com/watch?v=QH2-TGUlwu4 permanent;',
}

service { 'nginx':
  ensure => running,
  require => package['nginx'],
}
