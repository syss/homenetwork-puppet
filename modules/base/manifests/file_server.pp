class base::file_server {

    file {'/etc/hdparm.conf':
        ensure  => file,
        content => file("$module_name/hdparm-file_server.conf"),
    }


    #LABEL=DATA4     /data       ext4    auto,rw,relatime    0   0
    mount { 'DATA4':
        name        => '/data',
        ensure      => mounted,
        atboot      => true,
        fstype      => 'ext4',
        device      => 'LABEL=DATA4',
        options     => 'auto,rw,relatime',
        remounts    => true,
    }

    package {'minidlna':
        ensure  => present,
    }

    file { '/etc/minidlna.conf':
        ensure      => file,
        content     => file("$module_name/minidlna.conf"),
    }

    service { 'minidlna':
        ensure      => running,
        enable      => true,
        subscribe   => File['/etc/minidlna.conf'],
    }

    file {['/data/dlna-index', '/data/dlna-index/Movies', '/data/dlna-index/Music']:
        ensure  => directory,
        owner   => 'data',
        group   => 'data',
    }

    file {'/data/dlna-index/Music/Albums':
        ensure  => link,
        target  => '/data/data/Music/Albums/',
        owner   => 'data',
        group   => 'data',
    }

    file {'/data/dlna-index/Movies/Movies':
        ensure  => link,
        target  => '/data/data/Movies/',
        owner   => 'data',
        group   => 'data',
    }

    file {'/data/dlna-index/Movies/MusicVideos':
        ensure  => link,
        target  => '/data/data/Music/MusicVideos/',
        owner   => 'data',
        group   => 'data',
    }

    file {'/data/dlna-index/Movies/Series':
        ensure  => link,
        target  => '/data/data/Series/',
        owner   => 'data',
        group   => 'data',
    }
}                                                 
