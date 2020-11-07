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
	sudo npm i intelephense -g
	sudo npm i -g prettier @prettier/plugin-php

install:
	vim +PlugInstall +PlugClean! +qall

update:
	vim +PlugUpdate +qall
