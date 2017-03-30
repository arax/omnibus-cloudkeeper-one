require 'facter'

name 'cloudkeeper-one'
maintainer 'Boris Parak <parak@cesnet.cz>'
homepage 'https://github.com/the-cloudkeeper-project/cloudkeeper-one'
description 'Synchronize cloud appliances between cloudkeeper and OpenNebula.'

install_dir     '/opt/cloudkeeper-one'
build_version   "1.1.0"
build_iteration 2

override :rubygems, :version => '2.6.8'
## WARN: do not forget to change RUBY_VERSION in the postinst script
##       when switching to a new minor version
override :ruby, :version => '2.2.6'

# creates required build directories
dependency 'preparation'

# cloudkeeper dependencies/components
dependency 'cloudkeeper-one'

# version manifest file
dependency 'version-manifest'

# tweaking package-specific options
package :deb do
  vendor 'CESNET, Grid Department <cloud@metacentrum.cz>'
  license 'Apache License, Version 2.0'
  priority 'extra'
  section 'net'
end

package :rpm do
  vendor 'CESNET, Grid Department <cloud@metacentrum.cz>'
  license 'Apache License, Version 2.0'
  category 'Applications/System'
end

exclude '\.git*'
exclude 'bundler\/git'
