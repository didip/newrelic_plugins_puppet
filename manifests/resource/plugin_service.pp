define newrelic_plugins_puppet::resource::plugin_service (
  $daemon,
  $daemon_dir,
  $plugin_name,
  $plugin_version,
  $run_command,
  $service_name
) {
  file { "/etc/init.d/${name}":
    ensure  => file,
    content => template('newrelic_plugins_puppet/service.erb'),
    mode    => 0755
  }

  service { "${name}":
    ensure    => running,
    enable    => true,
    subscribe => File["/etc/init.d/${name}"]
  }
}