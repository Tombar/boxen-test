class people::tombar{

  include alfred
  include ctags
  include chrome
  include chrome::canary


  include osx -> include fish
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
