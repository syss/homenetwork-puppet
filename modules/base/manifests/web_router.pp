class base::web_router {
    class { 'apache': }

    apache::vhost { 'apt-proxy.sue.ss':
        port            => '80',
        serveraliases   => ['apt-proxy'],
        docroot         => '/var/www',
        docroot_owner   => 'www-data',
        docroot_group   => 'www-data',
        proxy_pass      => [
            { 'path' => '/',   'url' => 'http://rpi1.sue.ss:3142/' },
        ],
    }
    apache::vhost { 'torrent.sue.ss':
        port            => '80',
        serveraliases   => ['torrent', 'rtorrent'],
        docroot         => '/var/www',
        docroot_owner   => 'www-data',
        docroot_group   => 'www-data',
        proxy_pass      => [
            { 'path' => '/',        'url' => 'http://rpi1.sue.ss/' },
        ],
    }
    apache::vhost { 'dl.sue.ss':
        port            => '80',
        serveraliases   => ['dl','pyload','pyload.sue.ss'],
        docroot         => '/var/www',
        docroot_owner   => 'www-data',
        docroot_group   => 'www-data',
        proxy_pass      => [
            { 'path' => '/',        'url' => 'http://rpi1.sue.ss:8000/' },
        ],
    }
    apache::vhost { 'dlna.sue.ss':
        port            => '80',
        serveraliases   => ['dlna'],
        docroot         => '/var/www',
        docroot_owner   => 'www-data',
        docroot_group   => 'www-data',
        proxy_pass      => [
            { 'path' => '/',        'url' => 'http://cubox.sue.ss:8200/' },
        ],
    }
}
