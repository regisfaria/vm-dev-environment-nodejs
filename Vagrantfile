Vagrant.configure("2") do |config|
  # Image name
  config.vm.box = "ubuntu/bionic64"
  
  config.vm.provider "virtualbox" do |vb|
    # Display the VirtualBox GUI when booting the machine
    vb.gui = true
    
    vb.memory = "3072"
    vb.cpus = 2
    vb.customize ["modifyvm", :id, "--cpuexecutioncap", "50"]
  end
  
  # Postgres port forwarding
  config.vm.network "forwarded_port", guest: 5432, host: 5432  

  config.vm.provision "shell", inline: "sudo apt-add-repository multiverse && sudo apt-get update"
  # Install xfce and virtualbox additions.
  config.vm.provision "shell", inline: "sudo apt-get install -y xfce4 virtualbox-guest-dkms virtualbox-guest-utils virtualbox-guest-x11"
  # Permit anyone to start the GUI
  config.vm.provision "shell", inline: "sudo sed -i 's/allowed_users=.*$/allowed_users=anybody/' /etc/X11/Xwrapper.config"

  # Additional, not required
  config.vm.provision "shell", inline: "sudo apt-get install -y lightdm lightdm-gtk-greeter"
  config.vm.provision "shell", inline: "sudo apt-get install -y xfce4-whiskermenu-plugin"

  # Some development dependencies and useful tools
  config.vm.provision "shell", path: "install_nodejs.sh"
  config.vm.provision "shell", path: "install_yarn.sh"
  config.vm.provision "shell", path: "install_vscode.sh"
  config.vm.provision "shell", path: "install_dbeaver.sh"
  config.vm.provision "shell", path: "install_chrome.sh"
  config.vm.provision "shell", path: "install_docker.sh"

  # Install Docker Postgres
  config.vm.provision "docker" do |docker|
    docker.run "bitnami/postgresql:latest", args: "--name postgresql -p 5432:5432 -e POSTGRESQL_USERNAME=postgres -e POSTGRESQL_PASSWORD=postgres -e"
  end
end
