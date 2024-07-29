SHELL := /bin/sh
.DEFAULT_GOAL := build

build:
	mkdir -p _build/src
	rm -rf _build/src/*
	cp -r rdkafka-* _build/src/
	cp -r debian _build/src/
	cp -r package*.xml _build/src/
	cd _build/src && dpkg-buildpackage -b -rfakeroot -us -uc
	cd ../../

clean:
	test -d _build || rm -rf _build
