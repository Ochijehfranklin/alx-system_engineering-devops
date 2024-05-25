# increase traffic nginx can hold

# increase the ULIMIT of the default file
exec { 'fix--f0r-nginx':
  # modify ULIMIT value
  command => '/bin/sed -i "s/15/4096/" /etc/default/nginx',
  # specify path fpr sed command
  path => '/user/local/bin/:/bin/',
}

# restart nginx
exec { 'nginx-restart':
# restart nginx service
  command => 'etc/init.d/nginx restart',
# s[ecify pth for init .d script
  path    => 'etc/init.d/',
}
