class base::dns {

    package {'dnsutils':
        ensure  => present,
    }

    class { '::dns':
        forwarders  => ['8.8.8.8','8.8.4.4'],
    }

    dns::zone { 'sue.ss':
        static_records  => true,
    }
    dns::record {'a1.sue.ss':
        target  => '10.0.0.1',
        type    => 'A',
    }
    dns::record {'cubox.sue.ss':
        target  => '10.0.0.11',
        type    => 'A',
    }
    dns::record {'rpi1.sue.ss':
        target  => '10.0.0.12',
        type    =>  'A',
    }
    dns::record {'retropie.sue.ss':
        target  => '10.0.0.21',
        type    =>  'A',
    }
    dns::record {'printer.sue.ss':
        target  => '10.0.0.31',
        type    =>  'A',
    }
    dns::record {'ns0.sue.ss':
        target  => 'cubox.sue.ss',
        type    =>  'CNAME',
    }
    dns::record {'gw.sue.ss':
        target  => 'a1.sue.ss',
        type    =>  'CNAME',
    }

}
