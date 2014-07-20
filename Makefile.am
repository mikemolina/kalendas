SUBDIRS = bin man po doc woe
ACLOCAL_AMFLAGS = -I m4
DATE = `date -u "+%Y-%m-%d %T %Z"`
EXTRA_DIST = build-aux/config.rpath extra/nonls.diff autogen.sh autoclean.sh LEAME LICENCIA DEPENDENCES
DISTCLEANFILES = DIST_REVISION

dist-hook:
	@echo $(DATE) > DIST_REVISION
	cp DIST_REVISION $(distdir)/
