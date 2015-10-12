class hostapd::config {

  file { '/etc/hostapd/hostapd.conf':
    owner   => root,
    group   => root,
    mode    => '0600',
    content => template('hostapd/hostapd.conf.erb'),
  }

  augeas { 'interfaces':
    incl    => '/etc/network/interfaces',
    lens    => 'Interfaces.lns',
    changes => [
      "set iface[. = '${hostapd::bridge}'][family = 'inet6']/hostapd /etc/hostapd/hostapd.conf",
    ],
  }

}
