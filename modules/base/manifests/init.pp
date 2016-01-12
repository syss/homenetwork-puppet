class base {
	$packages = ['htop', 'vim', 'nload', 'unp', 'hdparm', 'vim-puppet', 'git', 'nmap', 'rsync', 'lsof', 'screen', 'fail2ban']

	ensure_packages ($packages)
	
	file {'/root/.vimrc':
		ensure	=> file,
		content => file("$module_name/.vimrc"),
	}

    file {'/etc/apt/detect-http-proxy':
        ensure  => file,
        mode    => 755,
        content => file("$module_name/apt/detectproxy"),
    }

    file {'/etc/apt/apt.conf.d/01proxy':
        ensure  => file,
        content => file("$module_name/apt/01proxy"),
    }

    file {['/root/.ssh/','/opt']:
        ensure  => directory,
    }

    ssh_authorized_key { 'syss@i7':
        user    => ['root','data'],
        type    => 'ssh-rsa',
        key     => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQDH10b3OQQrVv50coK2EDDWB9fVG91wECknhbAnVlJr+kejIDRO+2Z4Bp92CgNyHmcMEsY82gwNBxnUdwcQiii1AUX2rL5FBXhs05eziKVZki3YWAaZq3BSScttpsUKbASIg5+LrGB/bjPG/sjs6eT/8/I2hsz9r216q/uytjsJut7A4ny2bVvFz0uLibeslIxdrf2Zxz8aakdWs6mz5uqPQhe3+HpIzrd1+jh5xhslX41wOVOnzyzxU4FdojmSAMUwXGOLnIgAgL4RQd3P+pDNJ2jRx8OluEonDpXAYWQtazEqKK7Mi4bYytJMhOPqkoJn0KgzwXEkLqqR21MhB+ll',
    }

    ssh_authorized_key { 'root@rpi1':
        user    => ['root','data'],
        type    => 'ssh-rsa',
        key     => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQCjVwFi9nKovwYk00W5n5H13+bm4lxci7r7mwlXnxTktpPIsfED8k5wpgXJBAvoCAYkLs9ss7es+V2SSaIWUwtAJtgGYGWjIlEdEyndcWTDsX5gfxZXfVQ4pqSReZKqkxn5XXaIzg7cyFt4dIvzTxQ+IlYMYhPZC/1Dn5JVixjW7L5n3LaJjGJ8rN0Hp4oNST735IhwWYT8Q8y731GURxBM2o/ZjNnWwRla/t2Y+zvRW2VUkP/W9WI0Krfc0Dj3h+N9D145LZs4CvtWOh26fJMI5oS6bTNon55bSa+nyxBb8K4ZjSLBpm+JhXKNKKadvIMWlJbAK8Cwvynzk3TqlY5N',
    }

    ssh_authorized_key { 'root@cubox':
        user    => 'root',
        type    => 'ssh-rsa',
        key     => 'AAAAB3NzaC1yc2EAAAADAQABAAACAQC4PPM13TMJ154Tl3Uy52r+/3+lnNkOMlS6RMfb4MQVvfcCj7k7fa4HMsgMM5/18PyGigWrgtO+hK63xlDdO5dy+jcwfACo4kjSAtgR/4OiMeBkI3gKSvGUVhJgh8sO+It9o/0eOkqWXhoB4N8lqGkI8NIuJo3YLiVML4verVUiA4Rb2FJhPFycRGDWMA1BI3bY3QUSlONFoHdiKKvS9oAfQl6Ij86TWaboZA5LKhHinHOV3J55rQkHu1eg7d4De/63XpT76WiexG0mqzuIl641AOU/QJKjv+zOw0xAUqv0FbhygAdAf3868D3YXK4cSjU7uoA7h/iQAsAbxmxHjtlTlL1IumYg/95hAfD8DM9D50RD+it/REbTIzN9vHDPgVovH45Uq1oSCB6DEA1snrPPMOvcDkPc1BEDC6DR+746cphmX/YF9YFIwKJNDOW5M9r9Eeb9VYZbcDQXMNyGFCHmeTTqvHYTsfKGAj1j1MWEzC1Vm+nrygvuu2LzHytnW7nbjFUhxADTQB3XAnmyK48mtXfW37iGWHX3nK6cKjsIqNJX9dVkSDoAySCO0XSu9mAx4jHKW2SmL43RJtIX/6vtC/n9YIqEd05D/pqbwUTSNQmHQnVmeXHcVaAK4mfDg0vBUToGCdBZJiXvPsRIeaBi7Q6sgm8UVSW1Y/43CU6qAQ==',
    }

    ssh_authorized_key { 'syss@ANB':
    user    => 'root',
    type    => 'ssh-rsa',
    key     => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQC72f6F+iES5/6CX/9/hZokQaYWBcXjQ+zwe/EH83HMbRvGFss5tzZJoL5uPomjOW5eroCGFGVX1XDa1srCS7Y45hpF7BAGT7vZu+ttNySdrnaLsZX31s4YF23f4HVMt/LPkvKsqQmnvm0FbothvKHZT6pUmsv7n5RRLTJfHTkTalHFZDqXvie8Sl1Z25tRFb6mTKm0ESZHITPTNC/mELfjmCvTep13U9eP1fcr2NG32RYVkH1DbleMSs3hUTVyo2tyddY7wIriKykIZpYawMg7ZYRoD4EOSoO9UIOFyMGDhW/ednH/5UszRqCRJy1UDcXull2Khwl7dx2Ws6tqat8P'
    }

    #this is unsecure

    #ssh_authorized_key {'data@cubox':
    #    user    =>  'root',
    #    type    =>  'ssh-rsa',
    #    key     =>
    #    'AAAAB3NzaC1yc2EAAAADAQABAAACAQC3IHAz4BLcFgBVIGXtSmG/dQVX8sM9FjVK1A6YLSEEtQxLSb0nyf5pZubUINo+SkBJ2Tz4EanVH215bot/tVL2bgBSzJOKWAkqHpY6bMrvsc3a6CcHV3yVzKQWbixkCyLaNlpcXRN/CQxxoC/iULtBE+qoM4aH1XT5sQHyLV17/ygbs5A2KCLTQ7bek5ggxwmpaySRvhZHkEe+ygOscu8r1xK/CiH+lG1Kg3Qgpv7CFToxJku+H6TNsXN29cqywIySzYjp6YqyefD7MKkCWpzG/MmffFQ/gUnEfVtwKkQpD19hk0aenfTaS8UL7/p8GU0KZTCjQbmJSgm/g6cbOkpbbwLos9IqpU66qZSzvlVUY7DouP/HnjhMPl7xyYqzm4MEGHe+7/3D58YiKDTk7D9gEn+E7y18pP3ceBzAuF16KvfdLgtnVQVUdDUrjISpqKOMiOA8+GmN3dCZUqqY5uUoofZsqWa0l3Dmu6OsO1mJmUKon5LN4OQPKbmU+xXjeMTcTX/byK60Q1IGU5L0J+50yhNOMxPhNXTZz1MD9pzIjlw/P1mvEhwmtIF7EsN6jFSLsbma5OvI/ckSbwnBMDBDAZcyLfF2YD1f5Vp58wnX8iw/y5pQ/aItwd5pefJsLTagG/mp2VVyb/j9NXGC8R1Uu15Zrz6pMMimvcEegMdIBw==',
    #}
    ssh_authorized_key {'rsync@android':
        user    => 'root',
        type    => 'ssh-dss',
        key     =>
        'AAAAB3NzaC1kc3MAAACBAKAIu8tPLJZcBT2md8DpLH6VQFlDBgp/dIqNFXaXRj86B6MaTwqkpi7HK3yIOL+kAoD+RE2M792eKUVFN0/v0VnIEXfONowKP6WDbfcPaPXtkOyNSBCwGGSYXXwICtDV3WQQXEWcHvR1Sgp9qCJcNw5D5MrMpP6gWyLvwdNpC25lAAAAFQCxe2PIFKwH6lUMDA9W2kbHj1TxkQAAAIBL5W4vlNeghm6cqE9YJ6bAGuYhKzjoDwXq7BCiLEvm5IYSJCB6NflqVeQDNspaq+e8FGo4IAODlk740eOCQGieQwIzIZRe7J4zAV6QwKpeWVNTFPCfztAzwJE9QZtdZXJ3qjY8TdKsSbJy5+oFfUqBM/ITIgSDQG+NutB99vegdQAAAIBB5+fxxcLAsJKw6jKRcQp3xGqu0bGMhy3KQFJV1z8iIP0WduOAByA6YX/40GBxHT9yB/eZJlPoHdiA48i2qw90tZL/fTWF8a2wb7rbgqi2j2UXPCk0pB61rBlGRCLAQKLy4XKE4ofnsNYS0N6CyN7skjY/p/8bKSqEJ3sC1QyXag==',
    }
}
