Vagrant.configure("2") do |config|
    config.vm.box = "precise64"

    config.vm.network "private_network", ip: "192.168.40.2"
    config.vm.network "public_network"

    config.vm.provision "ansible" do |ansible|
        ansible.playbook = "provision.yml"
    end
end
