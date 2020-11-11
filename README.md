# Generator of syntax/vim.vim

[![Build Status](https://travis-ci.com/github/vim-jp/syntax-vim-ex.svg?branch=generator)](https://travis-ci.com/github/vim-jp/syntax-vim-ex)

Full open source sytax/vim.vim generator.

You can download generated recent syntax/vim.vim at <http://vim-jp.org/syntax-vim-ex/>.

## How to Build on Local

    $ git clone -b generator https://github.com/vim-jp/syntax-vim-ex.git
    $ cd syntax-vim-ex
    $ git submodule init
    $ git submodule update --depth 50

Then execute `make` will generate `vim.vim`.

    $ make

It will generate `vim.vim`

## How to catch up Vim

For maintainers.

Preparation:

    $ git clone -b generator git@github.com:vim-jp/syntax-vim-ex.git
    $ cd syntax-vim-ex
    $ git submodule init
    $ git submodule update --depth 100

How to catch up Vim and deploy new syntax/vim.vim:

    $ cd syntax-vim-ex/vim
    $ git pull -p
    $ cd ..
    $ git commit -am "catch up vim 7.4.xxx ..."
    $ git push

When push to `master` branch, travis-ci built new sytanx/vim.vim and deploy it
to gh-pages <http://vim-jp.org/syntax-vim-ex/> automatically.

## Files

Name                 |Description
---------------------|------------------------------------------------------
`README.md`          |This file
`Makefile`           |Makefile to generate vim.vim
`gen_syntax_vim.vim` |Script to generate vim.vim
`update_date.vim`    |Script to update "Last Change:"
`vim.vim.base`       |Template for vim.vim
`vim`                |Submodule to include github.com/vim/vim
`tools/`             |Misc tools: used to deploy from Travis-CI
