RUN_VIM = vim -N -u NONE -i NONE -n 
VIM_SRCDIR = ./vim/src
REVISION ?= $(shell date +%Y-%m-%dT%H:%M:%S%:z)

SRC =	$(VIM_SRCDIR)/eval.c $(VIM_SRCDIR)/ex_cmds.h $(VIM_SRCDIR)/ex_docmd.c \
		$(VIM_SRCDIR)/fileio.c $(VIM_SRCDIR)/option.c $(VIM_SRCDIR)/syntax.c

export VIM_SRCDIR

build: vim.vim

builddiff: update build diff

test: vim.vim
	grep -e '^let b:loaded_syntax_vim_ex=' vim.vim | grep -v -e __REVISION__

update:
	(cd vim; git pull -p)

diff:
	git stash
	git checkout master
	git pull -f
	cp -f vim.vim syntax/
	git diff --word-diff
	git checkout -f master
	git checkout generator
	git stash pop

clean:
	rm -f vim.vim.rc
	rm -f vim.vim

distclean: clean

.PHONY: build builddiff test update diff clean distclean

vim.vim: vim.vim.rc update_date.vim
	cp -f vim.vim.rc vim.vim
	$(RUN_VIM) -S update_date.vim
	sed -i -e 's/__REVISION__/$(REVISION)/' vim.vim

vim.vim.rc: gen_syntax_vim.vim vim.vim.base $(SRC)
	rm -f sanity_check.err generator.err
	$(RUN_VIM) -S gen_syntax_vim.vim
	@if test -f sanity_check.err ; then \
		echo ; \
		echo "Sanity errors:" ; \
		cat sanity_check.err ; \
		exit 1 ; \
	fi
	@if test -f generator.err ; then \
		echo ; \
		echo "Generator errors:" ; \
		cat generator.err ; \
		echo ; \
		exit 1 ; \
	fi
