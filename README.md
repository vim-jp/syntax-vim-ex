# Generator of syntax/vim.vim

[![Build Status](https://travis-ci.org/vim-jp/gen_syn_vim.svg?branch=master)](https://travis-ci.org/vim-jp/gen_syn_vim)

Full open source sytax/vim.vim generator.

You can download generated recent syntax/vim.vim at <http://vim-jp.org/gen_syn_vim/>.

## How to Build on Local

    $ git clone https://github.com/vim-jp/gen_syn_vim.git
    $ cd gen_syn_vim
    $ git submodule init
    $ git submodule update --depth 50

Then execute `make` will generate `vim.vim`.

    $ make

It will generate `vim.vim`

## How to catch up Vim

For maintainers.

Preparation:

    $ git clone git@github.com:vim-jp/gen_syn_vim.git
    $ cd gen_syn_vim
    $ git submodule init
    $ git submodule update --depth 100

How to catch up Vim and deploy new syntax/vim.vim:

    $ cd gen_syn_vim/vim
    $ git pull -p
    $ cd ..
    $ git commit -am "catch up vim 7.4.xxx ..."
    $ git push

When push to `master` branch, travis-ci built new sytanx/vim.vim and deploy it
to gh-pages <http://vim-jp.org/gen_syn_vim/> automatically.
