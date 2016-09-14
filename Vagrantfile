unless Vagrant.has_plugin?("vagrant-hosts")
  raise 'vagrant-hosts plugin is not installed, Please run command "vagrant plugin install vagrant-hosts" to install'
end

CLIENT_NODE_COUNT = 2

Vagrant.configure(2) do |config|
  
	config.vm.box = "ubuntu/trusty64"
  
    	config.vm.define "puppet" do |puppet|
		puppet.vm.network "private_network", ip: '192.168.33.11'
		puppet.vm.hostname = 'puppet.vup.local'
		puppet.vm.provision :hosts, :sync_hosts => true	
				  
		puppet.vm.provider "virtualbox" do |vb|
			vb.memory = "3062"
		end
		
		puppet.vm.provision "shell", path: "installer/puppetserver.sh"
		
		puppet.vm.post_up_message = "
		-----------------------------------------
		Environment successfully set up
		Step 1. add host entry in host file '192.168.33.11 puppet.vup.local'
		Step 2. Open http://puppet.vup.local url in browse
		-----------------------------------------"	
	end
	
	CLIENT_NODE_COUNT.times do |i|
		node_number = i + 1
		node_id = "node#{node_number}"
		config.vm.define node_id do |node|
			node.vm.network "private_network", ip: "192.168.33.22#{node_number}"
			node.vm.hostname = "#{node_id}.vup.local"
			node.vm.provision :hosts, :sync_hosts => true			
			node.vm.provision "shell", path: "installer/puppetclient.sh"
		end		
	end	
end
