Vagrant.configure("2") do |config|

    config.vm.define "node1" do |node1|
        node1.vm.box = "ubuntu/bionic64"
        node1.vm.network "private_network", ip: "192.168.10.12"
        node1.vm.hostname = "node1"
        node1.vm.provider "virtualbox" do |vb|
            vb.memory = "2048"
            vb.name = "node1"
        end
    end

    config.vm.define "node2" do |node2|
        node2.vm.box = "ubuntu/bionic64"
        node2.vm.network "private_network", ip: "192.168.10.13"
        node2.vm.hostname = "node2"
        node2.vm.provider "virtualbox" do |vb|
            vb.name = "node2"
            vb.memory = "2048" 
        end
    end
    
    config.vm.define "node3" do |node3|
        node3.vm.box = "ubuntu/bionic64"
        node3.vm.network "private_network", ip: "192.168.10.14"
        node3.vm.hostname = "node3"
        node3.vm.provider "virtualbox" do |vb|
            vb.name = "node3"
            vb.memory = "1500"
        end
    end

    config.vm.define "node4" do |node4|
        node4.vm.box = "ubuntu/bionic64"
        node4.vm.network "private_network", ip: "192.168.10.15"
        node4.vm.hostname = "node4"
        node4.vm.provider "virtualbox" do |vb|
            vb.name = "node4"
            vb.memory = "1500"
        end
    end

    config.vm.define "node5" do |node5|
        node5.vm.box = "ubuntu/bionic64"
        node5.vm.network "private_network", ip: "192.168.10.16"
        node5.vm.hostname = "node4"
        node5.vm.provider "virtualbox" do |vb|
            vb.name = "node5"
            vb.memory = "1500"
        end
    end
end