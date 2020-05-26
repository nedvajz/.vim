# Installs extensions and compiles things that need compiling.
#
#
help:
	@echo "init    - Init .vimrc & vim-plug."
	@echo "install - vim-plug install plugins."
	@echo "update  - vim-plug update plugins."

init:
	ln -sf ~/.vim/vimrc ~/.vimrc
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	sudo npm i intelephense -g

install:
	vim +PlugInstall +PlugClean! +qall

update:
	vim +PlugUpdate +qall
