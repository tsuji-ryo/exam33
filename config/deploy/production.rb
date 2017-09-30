server '13.112.39.205', user: 'app', roles: %w{app db web}
set :ssh_options, keys: '/Users/tsuji/.ssh/id_rsa'