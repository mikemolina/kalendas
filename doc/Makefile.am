info_TEXINFOS = kalendas.texi
kalendas_TEXINFOS = gpl.texi fdl.texi
EXTRA_DIST = encoding.texi.in kalendas.htm
AM_MAKEINFOHTMLFLAGS = --no-headers --no-split
MAINTAINERCLEANFILES = kalendas.info kalendas.htm

kalendas.htm: kalendas.texi
	$(MAKEINFOHTML) $(AM_MAKEINFOHTMLFLAGS) -o $@ $<
	sed -i -e 's:text/html:text/html; charset=UTF-8:g' $@
