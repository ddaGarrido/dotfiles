sudo apt-get update
clear

echo "Install NodeJs?(y/n)" 
read install_node
if echo "$install_node" | grep -iq "^y" ;then
	sudo apt install nodejs
	clear
else
	clear
fi

echo "Install Npm?(y/n)" 
read install_node
if echo "$install_node" | grep -iq "^y" ;then
	sudo apt install npm
	clear
else
	clear
fi

echo "Install Yarn?(y/n)" 
read install_node
if echo "$install_node" | grep -iq "^y" ;then
	npm install -g yarn
	clear
else
	clear
fi

echo "Install Node Foreman?(y/n)" 
read install_node
if echo "$install_node" | grep -iq "^y" ;then
	npm install -g foreman #node foreman
	clear
else
	clear
fi

echo "Install Java?(y/n)" 
read install_node
if echo "$install_node" | grep -iq "^y" ;then
	sudo apt-get install default-jre
	sudo apt-get install default-jdk
	clear
else
	clear
fi

echo "Install Git?(y/n)" 
read install_git
if echo "$install_git" | grep -iq "^y" ;then
	sudo apt install git -y
	clear
else
	clear
fi


echo "Configure Git user.name?(y/n)" 
read configure_git_user_name
if echo "$configure_git_user_name" | grep -iq "^y" ;then
	read git_config_user_name
	git config --global user.name "$git_config_user_name"
	clear
else
	clear
fi

echo "Configure Git user.email?(y/n)" 
read configure_git_user_name
if echo "$configure_git_user_email" | grep -iq "^y" ;then
	read git_config_user_email
	git config --global user.email $git_config_user_email
	clear
else
	clear
fi


echo "Generate SSH Key?(y/n)" 
read configure_ssh_key
if echo "$configure_ssh_key" | grep -iq "^y" ;then
	ssh-keygen -t rsa -b 4096 -C $git_config_user_email
	ssh-add ~/.ssh/id_rsa
	cat ~/.ssh/id_rsa.pub | xclip -selection clipboard
	clear
else
	clear
fi

echo "Install Vim?(y/n)" 
read install_vim
if echo "$install_vim" | grep -iq "^y" ;then
	sudo apt install vim -y
	clear
else
	clear
fi

echo "Can I set VIM as your default GIT editor for you? (y/n)"
read git_core_editor_to_vim
if echo "$git_core_editor_to_vim" | grep -iq "^y" ;then
	git config --global core.editor vim
	clear
else
	clear
fi

echo "Install VsCode?(y/n)"
read install_vs_code
if echo "$ginstall_vs_code" | grep -iq "^y" ;then
	curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
	sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
	sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
	sudo apt-get install apt-transport-https -y
	sudo apt-get update
sudo apt-get install code -y # or code-insiders
	clear
else
	clear
fi


echo "Install Postman?(y/n)" 
read install_postman
if echo "$install_postman" | grep -iq "^y" ;then
	snap install postman
	clear
else
	clear
fi

echo "Install gitkraken?(y/n)" 
read install_gitkraken
if echo "$install_gitkraken" | grep -iq "^y" ;then
	sudo snap install gitkraken --classic
	clear
else
	clear
fi

echo "Install chrome?(y/n)" 
read install_chrome
if echo "$install_chrome" | grep -iq "^y" ;then
	wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
	sudo dpkg -i google-chrome-stable_current_amd64.deb
	clear
else
	clear
fi

echo "Install Intellij?(y/n)" 
read install_intellij
if echo "$install_intellij" | grep -iq "^y" ;then
	sudo snap install intellij-idea-ultimate --classic
	clear
else
	clear
fi

echo "Install Nvm?(y/n)" 
read install_nvm
if echo "$install_nvm" | grep -iq "^y" ;then
	sh -c "$(curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash)"
	
	export NVM_DIR="$HOME/.nvm" && (
	git clone https://github.com/creationix/nvm.git "$NVM_DIR"
	cd "$NVM_DIR"
	git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" $(git rev-list --tags --max-count=1)`
	) && \. "$NVM_DIR/nvm.sh"


	export NVM_DIR="$HOME/.nvm"
	[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

	clear
else
	clear
fi

echo "Install docker?(y/n)" 
read install_docker
if echo "$install_docker" | grep -iq "^y" ;then
	sudo apt-get remove docker docker-engine docker.io
	sudo apt install docker.io -y
	sudo systemctl start docker
	sudo systemctl enable docker
	docker --version

	sudo curl -L "https://github.com/docker/compose/releases/download/1.26.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
	sudo chmod +x /usr/local/bin/docker-compose
	docker-compose --version

	clear
else
	clear
fi

echo "Install terminator?(y/n)" 
read install_terminator
if echo "$install_terminator" | grep -iq "^y" ;then
	sudo apt-get install terminator -y
	clear
else
	clear
fi

echo "Install aws-cli?(y/n)" 
read install_aws-cli
if echo "$install_aws-cli" | grep -iq "^y" ;then
	sudo apt-get install awscli -y
	aws --version
	curl "https://s3.amazonaws.com/session-manager-downloads/plugin/latest/ubuntu_64bit/session-manager-plugin.deb" -o "session-manager-plugin.deb"
	sudo dpkg -i session-manager-plugin.deb
	session-manager-plugin --version
	clear
else
	clear
fi

echo "Install zsh?(y/n)" 
read install_zsh
if echo "$install_zsh" | grep -iq "^y" ;then
	sudo apt-get install zsh -y
	sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
	chsh -s /bin/zsh


	source ~/.zshrc
	nvm --version
	nvm install 12
	nvm alias default 12
	node --version
	npm --version


	echo 'installing autosuggestions' 
	git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
	echo "source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ~/.zshrc
	source ~/.zshrc
	clear
else
	clear
fi


echo "Install sublime text?(y/n)" 
read install_sublime
if echo "$install_sublime" | grep -iq "^y" ;then
	wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -

	sudo apt-get install apt-transport-https

	echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list

	sudo apt-get update
	sudo apt-get install sublime-text
	clear
else
	clear
fi