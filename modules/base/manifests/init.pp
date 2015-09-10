class base {
	$packages = ['vim', 'nload', 'unp', 'hdparm', 'vim-puppet', 'git', 'nmap', 'rsync', 'lsof', 'dnsutils', 'screen']

	package {$packages:
		ensure	=> present,
	}
	
	file {'/root/.vimrc':
		ensure	=> file,
		content => file("$module_name/.vimrc"),
	}

    file {'/etc/apt/apt.conf.d/01proxy':
        ensure  => file,
        content => file("$module_name/01proxy"),
    }

    file {'/root/.ssh/':
        ensure  => directory,
    }

    ssh_authorized_key { 'root@rpi1':
        user    => ['root','data'],
        type    => 'ssh-rsa',
        key     => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQCjVwFi9nKovwYk00W5n5H13+bm4lxci7r7mwlXnxTktpPIsfED8k5wpgXJBAvoCAYkLs9ss7es+V2SSaIWUwtAJtgGYGWjIlEdEyndcWTDsX5gfxZXfVQ4pqSReZKqkxn5XXaIzg7cyFt4dIvzTxQ+IlYMYhPZC/1Dn5JVixjW7L5n3LaJjGJ8rN0Hp4oNST735IhwWYT8Q8y731GURxBM2o/ZjNnWwRla/t2Y+zvRW2VUkP/W9WI0Krfc0Dj3h+N9D145LZs4CvtWOh26fJMI5oS6bTNon55bSa+nyxBb8K4ZjSLBpm+JhXKNKKadvIMWlJbAK8Cwvynzk3TqlY5N',
    }

    ssh_authorized_key { 'root@cubox':
        user    => 'root',
        type    => 'ssh-rsa',
        key     => 'AAAAB3NzaC1yc2EAAAADAQABAAACAQC8g5fJvVi+2yNja4tSsO1I7CGlJ+PABnDWSu/bUswuGsZKvB1gRXBRhOj2I0Dz1ArBkYwXAu0s9+9kB9MvbupvI+gljZDbuWHCTQI/SUzb+Kyd76iaCoSb63YyyY3r80TxubcCvOVIH5YuTSZdsCMnTxmLkRjE8WTALvuiF5CZi67c5/T2N/14md+GgIT4ZcidX71CcYHFcQduXnj3IK7SBfaIJrc1LABk5kP68mM96/PjVgOspHNnOW0LZn7yk180tkGLbqGjLVlum3qfk1MS1xMuq4DFsG2kCDpOGxRAptx7o1bZ/owm+/mH8zMvu4J9pDAbOWXkS9p8UCkp7lLYLqayCwUEnPqRzfOSAF4TZSAcnE4DNozH3leyPmkifLRK5xzqx8ZKkrcr4WiNQNF4T06BGfA1eHbrZ/aKX5OhtUynjfTJ0bKHXaQ12zcmAm5vmsiqkEHD2FPbSzYkoqUp4TxW4rnQWy6WPU2iy8+QxUofjamRLT2NV/qfXFiuaP0Bv6nutU7Gfz8iwhz16aasFmof1upfvrV8D3ewBiFV7Cuol8LjVG5FabjYC9/fyXJjJP9VaCIvgsXcvdWPyvcpGzhaCpoXWIIAOwukRK0hd3lt+VUHLY3Qh/by2E6aXD+FJW3Ye3jDUiJWooU3MLsp62gVixR9sEs84SNSR1Iliw==',
    }
    ssh_authorized_key {'data@cubox':
        user    =>  'root',
        type    =>  'ssh-rsa',
        key     =>
        'AAAAB3NzaC1yc2EAAAADAQABAAACAQC3IHAz4BLcFgBVIGXtSmG/dQVX8sM9FjVK1A6YLSEEtQxLSb0nyf5pZubUINo+SkBJ2Tz4EanVH215bot/tVL2bgBSzJOKWAkqHpY6bMrvsc3a6CcHV3yVzKQWbixkCyLaNlpcXRN/CQxxoC/iULtBE+qoM4aH1XT5sQHyLV17/ygbs5A2KCLTQ7bek5ggxwmpaySRvhZHkEe+ygOscu8r1xK/CiH+lG1Kg3Qgpv7CFToxJku+H6TNsXN29cqywIySzYjp6YqyefD7MKkCWpzG/MmffFQ/gUnEfVtwKkQpD19hk0aenfTaS8UL7/p8GU0KZTCjQbmJSgm/g6cbOkpbbwLos9IqpU66qZSzvlVUY7DouP/HnjhMPl7xyYqzm4MEGHe+7/3D58YiKDTk7D9gEn+E7y18pP3ceBzAuF16KvfdLgtnVQVUdDUrjISpqKOMiOA8+GmN3dCZUqqY5uUoofZsqWa0l3Dmu6OsO1mJmUKon5LN4OQPKbmU+xXjeMTcTX/byK60Q1IGU5L0J+50yhNOMxPhNXTZz1MD9pzIjlw/P1mvEhwmtIF7EsN6jFSLsbma5OvI/ckSbwnBMDBDAZcyLfF2YD1f5Vp58wnX8iw/y5pQ/aItwd5pefJsLTagG/mp2VVyb/j9NXGC8R1Uu15Zrz6pMMimvcEegMdIBw==',
    }
    ssh_authorized_key {'rsync@android':
        user    => 'root',
        type    => 'ssh-dss',
        key     =>
        'AAAAB3NzaC1kc3MAAACBAKAIu8tPLJZcBT2md8DpLH6VQFlDBgp/dIqNFXaXRj86B6MaTwqkpi7HK3yIOL+kAoD+RE2M792eKUVFN0/v0VnIEXfONowKP6WDbfcPaPXtkOyNSBCwGGSYXXwICtDV3WQQXEWcHvR1Sgp9qCJcNw5D5MrMpP6gWyLvwdNpC25lAAAAFQCxe2PIFKwH6lUMDA9W2kbHj1TxkQAAAIBL5W4vlNeghm6cqE9YJ6bAGuYhKzjoDwXq7BCiLEvm5IYSJCB6NflqVeQDNspaq+e8FGo4IAODlk740eOCQGieQwIzIZRe7J4zAV6QwKpeWVNTFPCfztAzwJE9QZtdZXJ3qjY8TdKsSbJy5+oFfUqBM/ITIgSDQG+NutB99vegdQAAAIBB5+fxxcLAsJKw6jKRcQp3xGqu0bGMhy3KQFJV1z8iIP0WduOAByA6YX/40GBxHT9yB/eZJlPoHdiA48i2qw90tZL/fTWF8a2wb7rbgqi2j2UXPCk0pB61rBlGRCLAQKLy4XKE4ofnsNYS0N6CyN7skjY/p/8bKSqEJ3sC1QyXag==',
    }
}
