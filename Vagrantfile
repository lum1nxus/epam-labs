Vagrant.configure("2") do |config|
    servers=[
        {
          :hostname => "MainServer",
          :box => "ubuntu/trusty64",
          :ip => "172.17.1.50",
		  :guestport => "80",
		  :hostport => "8080",
		  :script => "master.sh"
        }
      ]

    servers.each do |machine|
        config.vm.define machine[:hostname] do |node|
            node.vm.box = machine[:box]
            node.vm.hostname = machine[:hostname]
            node.vm.network :private_network, ip: machine[:ip]
            node.vm.network "forwarded_port", guest: machine[:guestport], host: machine[:hostport]
            # if machine[:hostname] == "MasterServer" then
            #     node.vm.network "forwarded_port", guest: 8080, host: 8080
            # end
            # node.vm.provision :shell, inline: ""
			node.vm.provision :shell, path: machine[:script]

            node.vm.provider :virtualbox do |vb|
                vb.gui = true
                vb.customize ["modifyvm", :id, "--memory", 4096]
                vb.customize ["modifyvm", :id, "--cpus", 4]
                vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
                vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
            end
        end
    end
end