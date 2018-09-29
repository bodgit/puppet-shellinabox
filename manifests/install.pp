# @!visibility private
class shellinabox::install {

  package { $::shellinabox::package_name:
    ensure => present,
  }
}
