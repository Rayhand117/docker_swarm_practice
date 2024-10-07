Vagrant.configure("2") do |config|
  # Common configuration for all machines
  config.vm.box = "ubuntu/focal64"

  machine_names = ["manager1", "worker1"]

  machine_names.each_with_index do |machine_name, i|
    config.vm.define machine_name do |machine|
      machine.vm.hostname = machine_name
      machine.vm.network "private_network", ip: "192.168.50.#{i+4}", auto_correct: true

      machine.vm.provision "shell", inline: <<-SHELL
        sudo sed -i 's/^PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
        sudo sed -i 's/^#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config
        grep PasswordAuthentication /etc/ssh/sshd_config
        sudo systemctl restart ssh
        echo "holla from $(hostname)"
      SHELL

      machine.vm.provider "virtualbox" do |v|
        v.name = machine_name
        if machine_name == "manager1"
          v.memory = 1024
          v.cpus = 1
        else
          v.memory = 1024
          v.cpus = 1
        end
      end
    end
  end
end
