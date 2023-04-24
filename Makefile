SHELL=/bin/zsh

.PHONY: all
all: pre symbolic

.PHONY: pre
pre:
	if [ ! -d /usr/local/bin ]; then sudo mkdir -p /usr/local/bin; fi
	if [ ! -d ${HOME}/.config ]; then mkdir ${HOME}/.config; fi

.PHONY: symbolic
symbolic: zsh-symbolic sheldon-symbolic starship-symbolic nvim-symbolic

.PHONY: zsh-symbolic
zsh-symbolic:
	ln -sf ${PWD}/.zshenv ${HOME}/.zshenv
	if [ ! -d ${HOME}/.zsh ]; then mkdir ${HOME}/.zsh; fi
	ln -sf ${PWD}/zsh/.zshenv ${HOME}/.zsh/.zshenv
	ln -sf ${PWD}/zsh/.zshrc ${HOME}/.zsh/.zshrc
	ln -sf ${PWD}/zsh/.zprofile ${HOME}/.zsh/.zprofile

.PHONY: sheldon-symbolic
sheldon-symbolic:
	if [ ! -d ${HOME}/.config/sheldon ]; then mkdir -p ${HOME}/.config/sheldon; fi
	ln -sf ${PWD}/sheldon/plugins.toml ${HOME}/.config/sheldon/plugins.toml

.PHONY: starship-symbolic
starship-symbolic: 
	if [ ! -d ${HOME}/.config ]; then mkdir ${HOME}/.config; fi
	ln -sf ${PWD}/starship/starship.toml ${HOME}/.config/starship.toml

.PHONY: nvim-symbolic
nvim-symbolic: 
	if [ ! -d ${HOME}/.config/nvim ]; then mkdir -p ${HOME}/.config/nvim; fi
	ln -sf ${PWD}/nvim/init.vim ${HOME}/.config/nvim/init.vim
