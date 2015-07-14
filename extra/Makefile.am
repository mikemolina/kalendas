EXTRA_DIST = nonls.diff kalendas-bash-completion.sh

if ENABLED_BASH_COMPLETIONS
install-data-local:
	$(INSTALL) -d $(DESTDIR)$(bash_completions_dir)
	$(INSTALL_DATA) $(srcdir)/kalendas-bash-completion.sh $(DESTDIR)$(bash_completions_dir)/kalendas
endif

if ENABLED_BASH_COMPLETIONS
uninstall-local:
	rm -f $(DESTDIR)$(bash_completions_dir)/kalendas
endif
