CWD = $(shell pwd)

all: test-emacsdir early-init init custom snippetsdir

test-emacsdir:
	@echo "Checking to see if ~/.emacs.d exists. It will be created if not."
	@test -d ~/.emacs.d || mkdir ~/.emacs.d

early-init: early-init.el
	@ln -sf $(CWD)/early-init.el ~/.emacs.d/early-init.el
	@echo "Created symlink to ./early-init.el in ~/.emacs.d/early-init.el."

init: init.el
	@ln -sf $(CWD)/init.el ~/.emacs.d/init.el
	@echo "Created symlink to ./init.el in ~/.emacs.d/init.el."

custom:
	@echo "Checking to see if ./custom.el exists. It will be created if not."
	@test -f $(CWD)/custom.el || touch $(CWD)/custom.el
	@ln -sf $(CWD)/custom.el ~/.emacs.d/custom.el
	@echo "Created symlink to ./custom.el in ~/.emacs.d/custom.el."

snippetsdir:
	@echo "Checking to see if ./snippets exists. It will be created if not."
	@test -d $(CWD)/snippets || mkdir $(CWD)/snippets
	@rm -rf ~/.emacs.d/snippets
	@echo "Removed ~/.emacs.d/snippets if it existed."
	@ln -sf $(CWD)/snippets ~/.emacs.d/snippets
	@echo "Created symlink to ./snippets in ~/.emacs.d/snippets."
