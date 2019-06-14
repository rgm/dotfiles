all:
	./install

bootstrap:
	git submodule update --init --recursive
