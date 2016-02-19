RUN_VIM = vim -N -u NONE -i NONE -n
VIM_SRCDIR = ./vim/src

SRC =	$(VIM_SRCDIR)/eval.c $(VIM_SRCDIR)/ex_cmds.h $(VIM_SRCDIR)/fileio.c \
      	$(VIM_SRCDIR)/option.c $(VIM_SRCDIR)/syntax.c

export VIM_SRCDIR

build: vim.vim

test:

clean:
	rm -f vim.vim.rc
	rm -f vim.vim

distclean: clean

.PHONY: build test clean distclean

vim.vim: vim.vim.rc update_date.vim
	cp -f vim.vim.rc vim.vim
	$(RUN_VIM) -c "so update_date.vim"

vim.vim.rc: gen_syntax_vim.vim vim.vim.base $(SRC)
	rm -f sanity_check.err generator.err
	$(RUN_VIM) -c "so gen_syntax_vim.vim"
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
