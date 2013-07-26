# Setup mysql user of hrforecast
default['hrforecast']['database'] = {
  host: 'localhost',
  user_name: 'hrforecast',
  password: 'hrforecast_password'
}

# Application setting
default['hrforecast']['application'] = {
  port: 5127,
  host: '0.0.0.0'
}

# Machine setting
default['hrforecast']['system'] = {
  perlbrew_ver: "perl-5.18.0",
  install_dir: "/home/hrforecast/hrforecast_app"
}
