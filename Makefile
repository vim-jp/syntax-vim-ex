RUN_VIM = vim -N -u NONE -i NONE -n
VIM_SRCDIR = ./vim/src

export VIM_SRCDIR

build: vim.vim

test:

clean:
	rm -f vim.vim.rc
	rm -f vim.vim

distclean: clean
	rm -rf vim

.PHONY: build test clean distclean

vim:
	git clone --branch=master --single-branch --depth=1 https://github.com/vim/vim.git vim

vim.vim: vim.vim.rc update_date.vim
	cp -f vim.vim.rc vim.vim
	$(RUN_VIM) -c "so update_date.vim"

vim.vim.rc: vim gen_syntax_vim.vim vim.vim.base
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
