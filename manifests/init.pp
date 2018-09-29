# Manage ShellInABox
#
# @example Declaring the class with OS defaults
#   include ::shellinabox
#
# @example Declare an SSH instance listening on localhost-only suitable for a reverse proxy
#   class { '::shellinabox':
#     disable_ssl      => true,
#     disable_ssl_menu => true,
#     localhost_only   => true,
#     services         => {
#       '/' => 'SSH',
#     },
#   }
#
# @param package_name
# @param service_name
# @param certdir
# @param group
# @param port
# @param user
# @param disable_ssl
# @param disable_ssl_menu
# @param localhost_only
# @param services
#
# @since 1.0.0
class shellinabox (
  String                                                          $package_name,
  String                                                          $service_name,
  Stdlib::Absolutepath                                            $certdir,
  String                                                          $group,
  Bodgitlib::Port                                                 $port,
  String                                                          $user,
  Boolean                                                         $disable_ssl      = false,
  Boolean                                                         $disable_ssl_menu = false,
  Boolean                                                         $localhost_only   = false,
  Optional[Hash[Stdlib::Unixpath, ShellInABox::Type::Service, 1]] $services         = undef,
) {

  contain ::shellinabox::install
  contain ::shellinabox::config
  contain ::shellinabox::service

  Class['::shellinabox::install'] -> Class['::shellinabox::config']
    ~> Class['::shellinabox::service']
}
