class base {
	$packages = ['vim', 'nload', 'unp', 'hdparm', 'vim-puppet', 'git']

	package {$packages:
		ensure	=> present,
	}
	
	file {'/root/.vimrc':
		ensure	=> file,
		content => file("$module_name/.vimrc"),
	}

    service {'hdparm':
        ensure  => running,
        enable  => true,
        subscribe => File['/etc/hdparm.conf'],
    }
}
