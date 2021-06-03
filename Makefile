all:
	sudo apt-get install curl
	sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
	ln -s -f ~/stat-ubuntu-setup/.dotfiles/.zshrc ~/.config/nvim/
