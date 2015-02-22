DIR_EMACS=emacs
REMOTE_EMACS=dotemacs

.PHONY: emacs

emacs:
	git subtree pull --prefix $(DIR_EMACS) $(REMOTE_EMACS) master --squash
