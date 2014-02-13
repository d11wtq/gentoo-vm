# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # local variables for maintainability
  box_name = "gentoo-20131024-amd64-minimal.box"
  box_host = "https://dl.dropboxusercontent.com/s/mfurnvstqoj8w47"

  # using a gentoo install as the docker host
  config.vm.box     = "gentoo"
  config.vm.box_url = "#{box_host}/#{box_name}"

  # internal ip to avoid needing nat
  config.vm.network :private_network, ip: "192.168.20.3"

  # share a folder to hold projects into the vm
  config.vm.synced_folder "./projects", "/home/vagrant/projects",
    type:          "nfs",
    create:        true,
    mount_options: ["vers=3", "udp", "nolock"]

  # use agent forwarding for ssh/git etc
  config.ssh.forward_agent = true

  # provisioner script, using babashka internally
  config.vm.provision :shell,
    privileged: false,
    keep_color: true,
    path:       "./provision.sh"
end
