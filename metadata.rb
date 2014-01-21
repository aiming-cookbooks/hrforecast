name             'hrforecast'
maintainer       'Aiming Inc.'
maintainer_email 'info@aiming-inc.com'
license          'All rights reserved'
description      'Installs/Configures hrforecast'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.2'

%w{yum git mysql perlbrew}.each do |depend|
  depends depend
end
