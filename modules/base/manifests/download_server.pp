class base::download_server {

    $packages = ['sysfsutils','cpufrequtils']

    ensure_packages ($packages)

    file {'/root/letsencrypt-renew.sh':
        ensure  => file,
        content => file("$module_name/letsencrypt-renew.sh"),
        owner   => root,
        group   => root,
        mode    => '744',
    }

    cron {'letsencrypt-renew':
        command => '/root/letsencrypt-renew.sh',
        user    => root,
        hour    => 1,
        minute  => 0,
    }

    file {'/etc/sysfs.conf':
        ensure  => file,
        content => file("$module_name/download_server_sysfs.conf"),
        owner   => root,
        group   => root,
        mode    => '644',
    }

    file {'/etc/default/cpufrequtils':
        ensure  => file,
        content => file("$module_name/cpufrequtils"),
        owner   => root,
        group   => root,
        mode    => '644',
    }

    file {'/etc/hdparm.conf':
        ensure  => file,
        content => file("$module_name/hdparm-download_server.conf"),
    }
    service {'hdparm':
        ensure  => running,
        enable  => true,
        subscribe => File['/etc/hdparm.conf'],
    }

    mount { '/':
        name        => '/',
        ensure      => mounted,
        atboot      => true,
        fstype      => 'ext4',
        device      => '/dev/mmcblk0p2',
        options     => 'defaults,nofail,rw',
        remounts    => true,
    }
    mount { 'SCRATCH':
        name        => '/mnt/fts300gb',
        ensure      => mounted,
        atboot      => true,
        fstype      => 'ext4',
        device      => 'LABEL=SCRATCH',
        options     => 'defaults,nofail',
        remounts    => true,
    }
    mount { 'SWAP':
        name        => 'none',
        ensure      => mounted,
        atboot      => true,
        fstype      => 'swap',
        device      => '/var/cache/swap/myswap',
        options     => 'default',
    }

    vcsrepo {'/opt/pyload':
        ensure      => present,
        provider    => git,
        source      => 'https://github.com/pyload/pyload',
        revision    => 'stable',
        force       => true,
    }

    file {'/etc/init.d/pyload':
        ensure      => file,
        content     => file("$module_name/pyload/pyload.init"),
    }

    file {['/opt/pyload/module','/opt/pyload/module/config']:
        ensure  => directory,
    }

    #ensure that pyload always has all rights on this folder so it can start correctly
    file {'/mnt/fts300gb/var/pyload':
        ensure  => directory,
        owner   => 'pyload',
        group   => 'pyload',
        recurse => true,
    }

    file {'/opt/pyload/module/config/configdir':
        ensure  => file,
        content => '/mnt/fts300gb/var/pyload',
    }

    #block traffic for BT for better internetz performance
    file {'/root/block-bt.sh':
        ensure  => file,
        content => file("$module_name/rtorrent/block-bt.sh"),
        owner   => 'root',
        group   => 'root',
        mode    => 700,
    }

    file {'/root/unblock-bt.sh':
        ensure  => file,
        content => file("$module_name/rtorrent/unblock-bt.sh"),
        owner   => 'root',
        group   => 'root',
        mode    => 700,
    }
}
