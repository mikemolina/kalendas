dist_man1_MANS = kalendas.1
man_langs = es pt_BR
man_trad = kalendas.es.1 kalendas.pt_BR.1
man_sources = kalendas.en.pod kalendas.es.pod kalendas.pt_BR.pod
EXTRA_DIST = $(man_trad) $(man_sources)
MAINTAINERCLEANFILES = kalendas.1 $(man_trad)

HEAD = '$(PACKAGE) - Calendar Calculations'
HEADes = '$(PACKAGE) - Calculos de Calendario'
HEADpt_BR = '$(PACKAGE) - Calculos do Calendario'
#HEADlang = '$(PACKAGE) - translate(Calendar Calculations)'
MANNAME = @PESOS_SIGN@(shell echo "$(PACKAGE)" | tr '[:lower:]' '[:upper:]')
POD2MANFLAGS = --name='$(MANNAME)' --section=1 --release '$(PACKAGE_STRING)'
# Nota: la opcion '--utf8' en pod2man requiere perl version 5.8.8 o superior
if MANENCODING
ENCODINGFLAG =
else
ENCODINGFLAG = | $(ICONV) -f UTF-8 -t ISO-8859-1
endif

all: $(man_trad)

kalendas.1: kalendas.en.pod
	$(POD2MAN) $(POD2MANFLAGS) --date='2013-09-12' --center=$(HEAD) $< > $@

kalendas.es.1: kalendas.es.pod
	$(POD2MAN) $(POD2MANFLAGS) --date='2014-11-09' --center=$(HEADes) --utf8 $< $(ENCODINGFLAG) > $@

kalendas.pt_BR.1: kalendas.pt_BR.pod
	$(POD2MAN) $(POD2MANFLAGS) --date='2014-11-09' --center=$(HEADpt_BR) --utf8 $< $(ENCODINGFLAG) > $@

#kalendas.lang.1: kalendas.lang.pod
#	$(POD2MAN) $(POD2MANFLAGS) --date='AAAA-MM-DD' --center=$(HEADlang) --utf8 $< $(ENCODINGFLAG) > $@

install-data-hook:
	@manfile='kalendas.1'; \
	for lang in $(man_langs); do \
	  tmp=`echo $$manfile | sed -e "s/\.1/\.$$lang\.1/"`; \
	  if test -f $(srcdir)/$$tmp; \
	  then orig=$(srcdir)/$$tmp; \
	  else orig=$$tmp; \
	  fi; \
	  echo " $(mkinstalldirs) $(DESTDIR)$(mandir)/$$lang/man1"; \
	  $(mkinstalldirs) $(DESTDIR)$(mandir)/$$lang/man1; \
	  echo " $(INSTALL_DATA) $$orig $(DESTDIR)$(mandir)/$$lang/man1/$$manfile"; \
	  $(INSTALL_DATA) $$orig $(DESTDIR)$(mandir)/$$lang/man1/$$manfile; \
	done

uninstall-hook:
	@manfile='kalendas.1'; \
	for lang in $(man_langs); do \
	  echo " rm -f $(DESTDIR)$(mandir)/$$lang/man1/$$manfile"; \
	  rm -f $(DESTDIR)$(mandir)/$$lang/man1/$$manfile; \
	done
