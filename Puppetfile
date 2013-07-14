# This file manages Puppet module dependencies.
#
# It works a lot like Bundler. We provide some core modules by
# default. This ensures at least the ability to construct a basic
# environment.

def github(name, version, options = nil)
  options ||= {}
  options[:repo] ||= "boxen/puppet-#{name}"
  mod name, version, :github_tarball => options[:repo]
end

# Includes many of our custom types and providers, as well as global
# config. Required.

github "boxen", "2.3.6"

# Core modules for a basic development environment. You can replace
# some/most of these if you want, but it's not recommended.

github "dnsmasq",    "1.0.0"
github "gcc",        "2.0.1"
github "git",        "1.2.4"
github "homebrew",   "1.1.2"
github "hub",        "1.0.0"
github "inifile",    "0.9.0", :repo => "cprice404/puppetlabs-inifile"
github "nginx",      "1.4.2"
github "nodejs",     "3.2.7"
github "repository", "2.2.0"
github "ruby",       "6.0.2"
github "stdlib",     "4.1.0", :repo => "puppetlabs/puppetlabs-stdlib"
github "sudo",       "1.0.0"
github "xquartz",    "1.1.0"

# Optional/custom modules. There are tons available at
# https://github.com/boxen.

github "alfred",                          "1.0.1"
github "ctags",                           "1.0.0"
github "chrome",                          "1.1.0"
github "firefox",                         "1.1.1"
github "fish",                            "1.0.0"
github "geoip",                           "1.0.0"
github "heroku",                          "2.0.0"
github "iterm2",                          "1.0.2"
github "java",                            "1.1.0"
github "jmeter",                          "0.1.1"
github "notational_velocity",             "1.1.0"
github "skype",                           "1.0.2"
github "spectacle",                       "1.0.0"
github "tmux",                            "1.0.2"
github "tunnelblick",                     "1.0.1"
github "osx",                             "1.5.0"
github "property_list_key",               "0.1.0"
github "virtualbox",                      "1.0.1"
github "vagrant",                         "2.0.7"
github "vlc",                             "1.0.3"
github "wget",                            "1.0.0"



