# Installs extensions and compiles things that need compiling.
#
#
help:
	@echo "init    - Init .vimrc & vim-plug. & npm plugins"
	@echo "install - vim-plug install plugins."
	@echo "update  - vim-plug update plugins."

init:
	ln -sf ~/.vim/vimrc ~/.vimrc
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	sudo apt-get install -y nodejs silversearcher-ag exuberant-ctags
	sudo npm i intelephense -g
	sudo npm i -g prettier @prettier/plugin-php
	git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install
	sudo npm i -g eslint eslint-plugin-vue -D

install:
	vim +PlugInstall +PlugClean! +qall

update:
	vim +PlugUpdate +qall
