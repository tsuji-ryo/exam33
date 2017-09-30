server '172.31.26.253', user: 'app', roles: %w{app db web}
set :ssh_options, keys: '/Users/tsuji/.ssh/id_rsa'