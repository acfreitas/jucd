Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.define :jucd do |jucd|
    jucd.vm.hostname = 'jucd'
    jucd.vm.network :private_network, ip: '192.168.33.10'
    jucd.vm.synced_folder ".", "/var/jucd", owner: "vagrant", group: "vagrant"
    jucd.vm.network :forwarded_port, guest: 5432, host: 5432
    jucd.vm.network :forwarded_port, guest: 3000, host: 3000
    jucd.vm.provider :virtualbox do |vb|
       vb.customize ["modifyvm", :id, "--memory", "1024"]
       vb.customize ["modifyvm", :id, "--name", "jucd"]
    end
    jucd.vm.provision :shell, path: 'scripts/provision.sh', keep_color: true
  end
end