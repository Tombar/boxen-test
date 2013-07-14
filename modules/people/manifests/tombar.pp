class people::tombar{

  osx::recovery_message { 'If this Mac is found, please email martin.loy@batanga.com': } 


  include osx::global::enable_keyboard_control_access
  include osx::global::expand_save_dialog
  include osx::global::disable_remote_control_ir_receiver
  
  include osx::dock::2d
  include osx::dock::autohide
  include osx::dock::clear_dock

  include osx::dock::icon_size

  class { 'osx::dock::icon_size': 
    size => 16
  }

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
