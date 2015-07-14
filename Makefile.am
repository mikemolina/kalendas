SUBDIRS = bin man po doc woe extra
ACLOCAL_AMFLAGS = -I m4
DATE = `date -u "+%Y-%m-%d %T %Z"`
EXTRA_DIST = build-aux/config.rpath autogen.sh autoclean.sh README.md LEAME.md LICENCIA DEPENDENCIES
DISTCLEANFILES = DIST_REVISION

AM_DISTCHECK_CONFIGURE_FLAGS = --without-bash-completion

dist-hook:
	@echo $(DATE) > DIST_REVISION
	cp DIST_REVISION $(distdir)/

maintainer-clean-local:
	@langlist=`ls po/*.po`; \
	for lang in $$langlist; do \
	  if ! grep 'charset=UTF-8' $$lang 1>/dev/null; then \
	    $(MSGCONV) -t UTF-8 -o $$lang.t $$lang; \
	    rm $$lang; \
	    mv $$lang.t $$lang; \
	  fi; \
	done

