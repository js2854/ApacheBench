ROOT_DIR = $(shell pwd)
THIRDPARTY = $(ROOT_DIR)/thirdparty
INSTALL_PREFIX = $(ROOT_DIR)/install
CFLAGS = -O2

all: ab

prepare:
	cd $(THIRDPARTY); chmod +x make.sh; ./make.sh $(INSTALL_PREFIX)

ab: prepare
	gcc -o ab ab.c $(CFLAGS) -I$(INSTALL_PREFIX)/include -I$(INSTALL_PREFIX)/include/apr-1 `find $(INSTALL_PREFIX) -name *.a` -pthread -lm -ldl
	@echo "<Tips> Build 'ab' success!"
	@echo

clean:	
	find $(THIRDPARTY) -maxdepth 1 -mindepth 1 -type d -exec rm -rf {} \;	
	rm -rf $(INSTALL_PREFIX)/
	rm -f ab