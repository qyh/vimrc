.PHONY: all vim-go clean install test

WM ?= winmanager.zip
TLIST ?= taglist_46.zip
NERD_tree ?= NERD_tree.zip
SCRIPT_DIR ?= scripts
unzip_dir= vim
pack_dir= pack
install_dir= ~/.vim

load_on_start = $(install_dir)/pack/plugins/start
load_opt = $(install_dir)/pack/plugins/opt

all : unzip_dir vim-go wm nerd_tree

vim-go: 
	git submodule update --init

unzip_dir:
	mkdir -p $(unzip_dir)

wm:
	unzip $(SCRIPT_DIR)/$(WM) -d $(unzip_dir)
nerd_tree:
	unzip $(SCRIPT_DIR)/$(NERD_tree) -d $(unzip_dir) 
tlist:
	unzip $(SCRIPT_DIR)/$(TLIST) -d $(unzip_dir) 
install:
	mkdir -p $(load_on_start) $(load_opt) 
	cp -rf $(pack_dir)/* $(load_on_start)
	cp -rf $(unzip_dir)/* $(install_dir)/
	cp -rf ./.vimrc ~/.vimrc
	cp -rf $(SCRIPT_DIR)/python.vim $(install_dir)/plugin/
clean :
	-rm -rf $(pack_dir) $(unzip_dir)
test :
	echo $(install_dir)
