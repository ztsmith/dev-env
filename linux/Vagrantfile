Vagrant.configure(2) do |config|
  
  config.vm.provider :virtualbox do |vbox|
      vbox.memory = 4096      
  end
  
  config.vm.provision "git", type: "file" do |f|
    f.source = "~/.gitconfig"
    f.destination = ".gitconfig"
  end
  
  config.vm.provision "bash", type: "file" do |f|
    f.source = "#{ENV['VAGRANT_HOME']}/.bash_profile"
    f.destination = ".bash_profile"
  end

end
