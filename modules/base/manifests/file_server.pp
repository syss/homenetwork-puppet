class base::file_server {

    cron { backup:
            command => "rsync -aAXv --exclude={\"/dev/*\",\"/proc/*\",\"/sys/*\",\"/tmp/*\",\"/run/*\",\"/mnt/*\",\"/media/*\",\"/lost+found\",  \"/data\"} /* /data/data/HomeNetworkBackup/${fqdn}/backup-fs",
            user    => root,
            hour    => 3,
            minute  => 0,
            weekday => 1,
    }

    #cron { compress-reports:
    #        command => "xz /var/lib/puppet/reports/*/*.yaml",
    #        user    => puppet,
    #        hour    => 1,
    #        minute  => 0,
    #}
    
    file {'/etc/hdparm.conf':
        ensure  => file,
        content => file("$module_name/hdparm-file_server.conf"),
    }
    service {'hdparm':
        ensure  => running,
        enable  => true,
        subscribe => File['/etc/hdparm.conf'],
    }

    #/dev/mmcblk0p1 on / type ext4 (rw,relatime,data=ordered)

    mount { 'ROOT':
        name        => '/',
        ensure      => mounted,
        atboot      => true,
        fstype      => 'ext4',
        device      => '/dev/mmcblk0p1',
        options     => 'rw,relatime,data=ordered',
        remounts    => true,
    }

    file { '/data':
        ensure  => directory,
    } ->

    #LABEL=DATA4     /data       ext4    auto,rw,relatime    0   0
    mount { 'DATA4':
        name        => '/data',
        ensure      => mounted,
        atboot      => true,
        fstype      => 'ext4',
        device      => 'LABEL=DATA4',
        options     => 'auto,rw,noatime,nofail',
        remounts    => true,
    }

    #speedup transfer between client with compression=no (arm devices are weak and LAN is fast), reduced cipher to aes128-ctr
    #root@rpi1:/mnt/fts300gb /mnt/fts300gb   fuse.sshfs _netdev,user,idmap=user,transform_symlinks,identityfile=/root/.ssh/id_rsa,allow_other,    default_permissions,uid=1000,gid=1000 0 0
    mount { 'RPI1':
        name        => '/mnt/fts300gb',
        ensure      => mounted,
        atboot      => true,
        fstype      => 'fuse.sshfs',
        device      => 'root@rpi1:/mnt/fts300gb',
        options     => '_netdev,user,idmap=user,transform_symlinks,ciphers=aes128-ctr,compression=no,identityfile=/root/.ssh/id_rsa,allow_other,default_permissions,uid=1000,gid=1000',
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
        subscribe   => [File['/etc/minidlna.conf'],File['/var/cache/minidlna'],Exec['increase max inotify']],
        require     => Package['minidlna'],
    }

    exec { 'increase max inotify':
        command => 'echo "fs.inotify.max_user_watches = 100000" >> /etc/sysctl.conf \
        && sysctl -p /etc/sysctl.conf',
        unless  => 'grep -- "fs.inotify.max_user_watches = 100000" /etc/sysctl.conf',
    }

    file { ['/var/cache/minidlna','/var/lib/minidlna']:
        ensure      => directory,
        owner       => 'minidlna',
        group       => 'minidlna',
        recurse     => true,
        require     => Package['minidlna'],
    }

    file {['/data/dlna-index', '/data/dlna-index/Movies', '/data/dlna-index/Music']:
        ensure  => directory,
        owner   => 'data',
        group   => 'data',
        require => Mount['DATA4'],
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
