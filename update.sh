#!/bin/sh

git pull
cd files
	make fetch_lists
	make -q && exit 0
	make
cd ..
cd package
	makepkg
	cp PKGBUILD dnsblock-git
	cd dnsblock-git
		makepkg --printsrcinfo > .SRCINFO
		git commit -a -m "automatic update @ $(date)"
		git push
	cd ..
cd ..
git commit -a -m "automatic update @ $(date)"
git push

