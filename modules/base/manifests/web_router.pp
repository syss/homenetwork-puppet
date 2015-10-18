class base::web_router {
    class { 'apache': }

    apache::vhost { 'cubox.sue.ss':
        port            => '80',
        docroot         => '/var/www',
        docroot_owner   => 'www-data',
        docroot_group   => 'www-data',
        proxy_pass      => [
            { 'path' => '/rtorrent',    'url' => 'http://rpi1.sue.ss/' },
            { 'path' => '/pyload',      'url' => 'http://rpi1.sue.ss:8000/' },
            { 'path' => '/dlna',        'url' => 'http://cubox.sue.ss:8200/' },
            { 'path' => '/apt-proxy',   'url' => 'http://rpi1.sue.ss:3142/' },
        ],
        rewrites        => [
            {
                comment         => 'rtorrent',
                rewrite_cond    => ['%{HTTP_REFERER} ^http://%{SERVER_NAME}/rtorrent/$'],
                rewrite_rule    => ['^/?(.*) http://%{SERVER_NAME}/rtorrent/$1 [P,L]'],
            },
            {
                comment         => 'pyload',
                rewrite_cond    => ['%{HTTP_REFERER} %{SERVER_NAME}/pyload/$'],
                rewrite_rule    => ['^/?(.*) http://%{SERVER_NAME}/pyload/$1 [P,L]'],
            },
        ],
    }
}
