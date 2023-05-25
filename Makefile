MAKEFILE_DIR_SLASH := $(dir $(abspath $(firstword $(MAKEFILE_LIST))))
MAKEFILE_DIR := $(patsubst %/,%,$(MAKEFILE_DIR_SLASH))

.PHONY: all
all: pre init symbolic_link 

.PHONY: pre
pre:
	if [ ! -d /usr/local/bin ]; then sudo mkdir -p /usr/local/bin; fi
	if [ ! -d $(HOME)/.config ]; then mkdir $(HOME)/.config; fi

.PHONY: init
init:
	$(MAKEFILE_DIR)/scripts/init.sh

.PHONY: symbolic_link
symbolic_link:
	$(MAKEFILE_DIR)/scripts/symbolic_link.sh
