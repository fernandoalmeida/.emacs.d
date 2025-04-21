EMACS_VERSION := 24.4
EMACS_DIR := emacs-$(EMACS_VERSION)

emacs:
	wget http://ftp.gnu.org/gnu/emacs/emacs-$(EMACS_VERSION).tar.gz
	tar -zxf emacs-$(EMACS_VERSION).tar.gz
	sudo apt-get build-dep emacs24 --yes
	cd $(EMACS_DIR) && ./configure && make && sudo make install
	make clean

clean:
	rm -fr $(EMACS_DIR)*
