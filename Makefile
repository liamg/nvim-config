default: install

.PHONY: install
install:
	npm i -g neovim
	python3 -m pip install pynvim

