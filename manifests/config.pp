# @!visibility private
class shellinabox::config {

  $certdir = $::shellinabox::certdir
  $group   = $::shellinabox::group
  $port    = $::shellinabox::port
  $user    = $::shellinabox::user

  case $facts['os']['family'] {
    'RedHat': {
      $opts = join(delete_undef_values([
        $::shellinabox::disable_ssl ? {
          false   => undef,
          default => '--disable-ssl',
        },
        $::shellinabox::disable_ssl_menu ? {
          false   => undef,
          default => '--disable-ssl-menu',
        },
        $::shellinabox::localhost_only ? {
          false   => undef,
          default => '--localhost-only',
        },
        $::shellinabox::services ? {
          undef   => undef,
          default => join($::shellinabox::services.map |$x| {
            "--service '${x[0]}:${join(Array($x[1], true), ':')}'"
          }, ' ')
        },
      ]), ' ')

      file { '/etc/sysconfig/shellinaboxd':
        ensure  => file,
        owner   => 0,
        group   => 0,
        mode    => '0644',
        content => template("${module_name}/sysconfig.erb"),
      }
    }
    default: {
      # noop
    }
  }
}
