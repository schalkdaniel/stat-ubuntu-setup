all:
	sudo apt-get install curl
	mkdir ~/.config/nvim/
	ln -s -f ~/stat-ubuntu-setup/.dotfiles/init.vim ~/.config/nvim/


python-ebm:
	sudo apt-get install python3 python3-pip python3-venv
	mkdir ~/venv
	python3 -m venv ~/venv/ebm
	source ~/venv/ebm/bin/activate
	pip3 install pandas sklearn interpret
