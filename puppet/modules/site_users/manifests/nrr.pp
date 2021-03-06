class site_users::nrr {
	include package_zsh

	group {
		"nrr":
			gid => 16001,
			ensure => present;
	}

	user {
		"nrr":
			uid => 16001,
			gid => 16001,
			groups => "moyi",
			shell => "/bin/zsh",
			ensure => present,
			require => [
				Group["nrr"],
				Group["moyi"],
				Package["zsh"],
			];
	}

	file {
		"/home/nrr":
			ensure => directory,
			require => User["nrr"],
			owner => "nrr",
			group => "nrr";
		"/home/nrr/.ssh":
			ensure => directory,
			require => File["/home/nrr"],
			owner => "nrr",
			group => "nrr";
	}

	ssh_authorized_key {
		"nrr":
			user => "nrr",
			ensure => present,
			require => File["/home/nrr/.ssh"],
			key => "AAAAB3NzaC1yc2EAAAABIwAABAEArY7F/4iN150xd9Qcb7ZCsmTMS6H8WFt9m0yR1MloIQr3fZirhUHnQXS7APbshpwJdkdjCe6HN1UXrgFACdTIff7IdOfbI/mWt5sH8nrYSPiV8HL3LJo4GR+eXCGO8/PVBJDWRMNHTfww7cCY3GemEPq3OX3sjLqHKSbA3bcCROoT8ozBxXuYNNaEDbpkrb4TMAPrjoxDhWwulQIjLzL2wXjYfMP++JM74dOMnQDkUGEWVFdhFcQaRl2TVzVNXygtAndxi8Yanpd2InLldiE0fRThNHmtjk+6ec2tZ+DginCNmp5bcInK0NgiNEbpIsq+ZG2RsZxwdVwWZQZbZzYXeSg47PcgflK5nr036HyyOevvNVHoU5ZUANar9dURc4t7ZlSgXi8r7ViUExglyXMxtpey+z7gXWFaxriexDFWrd6TcCGCyr41WyMz5ejvCqRsjYKru1fGc5Ab62hymqJnW+qhnCulkEar6F7YTl/dERv4vpw8etRB++Zvf3Yq5zi1jwFg7sGkGqJR6WwW7MnoF/PIrGKVwncHWifCRt3ov9KuMSPiMD9ZrDFt6bUBYL4KEhEEQKevrP9qTFZF0sE3pXn0otnVSmQQx8166ry+sFqREe8uqbQK4EVcq79br7E8TVAWCz0wPjnJ3lqza5AmGDHnJ0gISmH+VCwnBErggdyxzzCySH94WEzX1JlF+kv7CSTZwOqTFKsNViWe9b4hirydIkPne7ZLDcvQiDU8DOi6PxtE/j+qeaYnEnP6h37drI5Urh4VfHJrziZGFF9VeaokCpXyN00jxIgv88es4eqwLAMuPUrFSKCQgEMXCWgXHrSYcU1xwrBRkGcr9P6K3wSCKYU/Ir6vxICjzW+OpDXhFOGa2t/01GU3T7Azl7tRL/yiu/LKrG0KQx+Ea2toKOz/QGYqfgbBJU1M5BREfkkP+HwHVNdNBjXSt506+7dO7BgHXoHpmEz4ujjiCxZ2/I+v+gFcxa+MNS3EMPM6hfa/iApMOG9paJGxie/u/ig9Bk05sXEk3mO8K/mfHuVLMCrlFJK5jBppttvt6RPSexEOYfKGh580kEXBzi4gzk4wFGQghmp7ZCxyldWRneuquObW6qTYpyTjLGdcUCHBZAXvuu9ao3QxpbKeB9MBfzYkm9CITFLokaZJVi2eFr0tswSbGk6m+UCq2K2GB+scYV7KK5rUkkBhspigV2fN+zw9KCpvp+HO3jQXIrFA9W8/+traafebjvkYCmuZOv0G3zzvmjbAb6ngAuZU7vF7AOosKqKv11K7EBxsRXAO8DfBF5o0XqFMCyYMTGeb6Y12YVMJnYVhjS7QABvZ/sgiEEwvUHNs0LXU5JOYjk8hL3aM/Q==",
			type => "rsa",
			name => "keys/ssh/corvidae.org/nrr/id_rsa.2011-09-12";
	}
}
