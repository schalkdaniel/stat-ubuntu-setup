all:
	sudo apt-get install curl
	mkdir ~/.config/nvim/
	ln -s -f ~/stat-ubuntu-setup/.dotfiles/init.vim ~/.config/nvim/
