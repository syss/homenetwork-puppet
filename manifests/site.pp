Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ] }
hiera_include('classes')

node cubox {
    include bind
    bind::zone {'sue.ss':
        zone_contact    => 'stefan.sue.ss',
        zone_ns         => ['ns0.sue.ss'],
        zone_serial     => '2015050701',
        zone_ttl        => '604800',
        zone_origin     => 'sue.ss',
    }

    bind::a { 'Hosts in sue.ss':
        ensure      => 'present',
        zone        => 'sue.ss',
        ptr         => false,
        hash_data   => {
            'cubox'     => {owner   => '10.0.0.11',},
            'rpi1'      => {owner   => '10.0.0.12',},
            'retropie'  => {owner   => '10.0.0.21',},
        },
    }

    bind::generate {'a-records':
        zone        => 'sue.ss',
        range       => '50-100',
        record_type => 'A',
        lhs         => 'wifi-$',
        rhs         => '10.0.0.$',
    }

    bind::record {'CNAME ns0.sue.ss':
        zone        => 'sue.ss',
        record_type => 'CNAME',
        hash_data   => {
            'ns0'       => { owner  => 'cubox', },
        }
    }
}

