class base::download_server {

    file {'/etc/hdparm.conf':
        ensure  => file,
        content => file("$module_name/hdparm-download_server.conf"),
    }
    service {'hdparm':
        ensure  => running,
        enable  => true,
        subscribe => File['/etc/hdparm.conf'],
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
}
