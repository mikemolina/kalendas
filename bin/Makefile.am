SUBST = @abs_top_builddir@/extra/substvars.sh

bin_SCRIPTS = kalendas
CLEANFILES = $(bin_SCRIPTS)
EXTRA_DIST = kalendas.in

kalendas: $(srcdir)/kalendas.in
if NONLS
	cp $(srcdir)/kalendas.in kalendas.in.t
	patch $(srcdir)/kalendas.in < ../extra/nonls.diff
	$(SUBST) $(srcdir)/kalendas.in > kalendas
	rm $(srcdir)/kalendas.in
	mv $(srcdir)/kalendas.in.t kalendas.in
else
	$(SUBST) $(srcdir)/kalendas.in > kalendas
endif
