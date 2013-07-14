class people::tombar{

  include osx
  osx::recovery_message { 'If this Mac is found, please email martin.loy@batanga.com' } 

  include alfred
  include ctags
  include chrome
  include chrome::canary

  include fish

  include firefox
  include geoip
  include heroku
  include iterm2::stable
  include java
  include jmeter
  include notational_velocity::nvalt
  include skype
  include spectacle
  include tmux
  include tunnelblick
  include virtualbox
  include vagrant
  include vlc
  include wget

  class { 'intellij':
    edition => 'community',
  }

#   $home     = "/Users/${::luser}"
#   $my       = "${home}/my"
#   $dotfiles = "${my}/dotfiles"
# 
#   repository { $dotfiles:
#     source  => 'jbarnette/dotfiles',
#     require => File[$my]
#   }
 

}
