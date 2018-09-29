# @!visibility private
class shellinabox::service {

  service { $::shellinabox::service_name:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}
