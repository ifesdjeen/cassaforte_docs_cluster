# -*- mode: ruby -*-

Vagrant::Config.run do |m|
  [1,2,3].each do |i|
    m.vm.define "cassaforte_node_#{i}" do |cassandra_node|
      cassandra_node.vm.box = "precise64"
      cassandra_node.vm.customize ["modifyvm", :id,
                        "--memory", 1024,
                        "--cpus",     "1"]

      cassandra_node.vm.network :hostonly, "192.168.60.#{i}"

      cassandra_node.vm.provision :shell, :inline => "sudo apt-get update --fix-missing"
      cassandra_node.vm.provision :shell, :inline => "sudo apt-get -y install zip"
      cassandra_node.vm.provision :shell, :inline => "sudo apt-get -y install python-software-properties"

      cassandra_node.vm.provision :chef_solo do |chef|
        chef.cookbooks_path = ["./cookbooks"]

        chef.add_recipe "apt"
        chef.add_recipe "java::oraclejdk7"
        chef.add_recipe "cassandra"


        chef.json = {
          :java => {
            :flavor => "sun"
          },
          :cassandra => {
            :cluster_name => "Test Cluster",
            :listen_address => "192.168.60.#{i}",
            :seeds => ["192.168.60.1"],
            :rpc_address => "192.168.60.#{i}",
            :num_tokens => 256,
            :seed_provider => "org.apache.cassandra.locator.SimpleSeedProvider"
          }
        }
      end
    end
  end
end
