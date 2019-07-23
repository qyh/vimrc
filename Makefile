.PHONY: all vim-go clean install test

WM ?= winmanager.zip
TLIST ?= taglist_46.zip
NERD_tree ?= NERD_tree.zip
SCRIPT_DIR ?= scripts
GITTER ?= vim-gitgutter.tgz
indentLine ?= indentLine/*
unzip_dir= vim
pack_dir= pack
install_dir= ~/.vim
syntax= ~/.vim/syntax

load_on_start = $(install_dir)/pack/plugins/start
load_opt = $(install_dir)/pack/plugins/opt

all : unzip_dir vim-go wm nerd_tree gitter indent-line

indent-line:
	cp -rf $(SCRIPT_DIR)/$(indentLine) $(unzip_dir)

vim-go: 
	git submodule update --init

unzip_dir:
	mkdir -p $(unzip_dir)

wm:
	unzip -o $(SCRIPT_DIR)/$(WM) -d $(unzip_dir)
nerd_tree:
	unzip -o $(SCRIPT_DIR)/$(NERD_tree) -d $(unzip_dir) 
gitter:
	tar xvf $(SCRIPT_DIR)/$(GITTER) -C $(unzip_dir) --overwrite
tlist:
	unzip -o $(SCRIPT_DIR)/$(TLIST) -d $(unzip_dir) 
install:
	mkdir -p $(load_on_start) $(load_opt) 
	mkdir -p $(syntax)
	cp -rf $(pack_dir)/* $(load_on_start)
	cp -rf $(unzip_dir)/* $(install_dir)/
	cp -rf ./.vimrc ~/.vimrc
	cp -rf $(SCRIPT_DIR)/python.vim $(syntax)/
	git clone https://github.com/leafgarland/typescript-vim.git ~/.vim/pack/typescript/start/typescript-vim
clean :
	-rm -rf $(pack_dir) $(unzip_dir)
test :
	echo $(install_dir)
