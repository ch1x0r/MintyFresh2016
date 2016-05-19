export SHELL = sh
PACKAGE = respin-mint
VERSION = 1.1.0-1
COPYRIGHTYEAR = 2016
AUTHOR = Respin Team
EMAIL = contact@linuxrespin.org

all: debian

debian: 
	[ ! -d ./build/debian/ ] || rm -r ./build/debian/
	mkdir -p ./build/debian/usr/bin
	mkdir -p ./build/debian/usr/share/applications/
	mkdir -p ./build/debian/usr/share/doc/respin/
	mkdir -p ./build/debian/usr/share/man/man1/
	mkdir -p ./build/debian/etc/respin/customisolinux/
	mkdir -p ./build/debian/etc/respin/isolinux/
	mkdir -p ./build/debian/etc/respin/plymouth/respin-theme/
	mkdir -p ./build/debian/etc/respin/preseed/
	mkdir -p ./dist
	
	cp src/respin ./build/debian/usr/bin/
	cp src/respin-skelcopy ./build/debian/usr/bin/
	cp src/progress_bar.png ./build/debian/etc/respin/plymouth/respin-theme/
	cp src/progress_box.png ./build/debian/etc/respin/plymouth/respin-theme/
	cp src/respin.png ./build/debian/etc/respin/plymouth/respin-theme/
	cp src/respin-theme.plymouth ./build/debian/etc/respin/plymouth/respin-theme/
	cp src/respin-theme.script ./build/debian/etc/respin/plymouth/respin-theme/
	cp src/isolinux.cfg.vesamenu ./build/debian/etc/respin/isolinux/
	cp src/splash.png ./build/debian/etc/respin/isolinux/
	cp src/custom.seed ./build/debian/etc/respin/preseed/
	cp src/respin.conf ./build/debian/etc/
	cp src/respin.version ./build/debian/etc/respin/
	cp src/respin.1 ./build/debian/usr/share/man/man1/
	gzip -9 ./build/debian/usr/share/man/man1/respin.1
	cp src/README ./build/debian/usr/share/doc/respin/
	cp src/copyright ./build/debian/usr/share/doc/respin/
	cp src/changelog.Debian ./build/debian/usr/share/doc/respin/
	gzip -9 ./build/debian/usr/share/doc/respin/changelog.Debian
	
	./tools/debian-package.sh "$(PACKAGE)" "$(VERSION)" "$(AUTHOR)" "$(EMAIL)" "all"


clean:
	rm -rf dist
	rm -rf build

