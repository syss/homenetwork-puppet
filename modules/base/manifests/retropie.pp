class base::retropie {
#    file { '/home/pi/RetroPie/roms':
#        ensure  => directory,
#        owner   => 'pi',
#        group   => 'pi',
#        source  => "puppet:///data/Games/_Roms",
#        recurse => remote,
#    }
}
