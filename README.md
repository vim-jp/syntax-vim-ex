# Generator of vim/rutime/syntax/vim.vim for main stream

Full open source runtime/sytax/vim.vim generator for main stream.

## How to generate on Local

    $ cd /path-to-your-vim/runtime/syntax
    $ git clone -b generator-for-mainstream https://github.com/vim-jp/syntax-vim-ex.git generator
    $ cd generator
    $ make

It will generate `vim.vim`

## Files

Name                 |Description
---------------------|------------------------------------------------------
`Makefile`           |Makefile to generate vim.vim
`README.md`          |This file
`gen_syntax_vim.vim` |Script to generate vim.vim
`update_date.vim`    |Script to update "Last Change:"
`vim.vim.base`       |Template for vim.vim
