SUBST = @abs_top_builddir@/extra/substvars.sh

bin_SCRIPTS = kalendas
CLEANFILES = $(bin_SCRIPTS)
EXTRA_DIST = kalendas.in

kalendas: $(srcdir)/kalendas.in
if NONLS
	cp $(srcdir)/kalendas.in kalendas.in.t
	patch kalendas.in.t < $(srcdir)/../extra/nonls.diff
	$(SUBST) kalendas.in.t > kalendas
	rm -f kalendas.in.t
else
	$(SUBST) $(srcdir)/kalendas.in > kalendas
endif
