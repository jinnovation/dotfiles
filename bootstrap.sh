#!/bin/bash

set -e

DOTDIR=$HOME/dotfiles

if [ -e $HOME/.vim ]
then
  echo "Moving old .vim/ to .vim.old/"
  mv $HOME/.vim/ $HOME/.vim.old
fi
mkdir $HOME/.vim
mkdir $HOME/.vim/autoload

# TODO: if vim-plug is empty, exit with note to init submodule
#       execute PlugInstall on vim

link_pairs=(
        $DOTDIR/emacs              .emacs
        $DOTDIR/vim-plug/plug.vim  .vim/autoload/plug.vim
        $DOTDIR/vim/vimrc          .vimrc
        $DOTDIR/vim/gvimrc         .gvimrc
        $DOTDIR/vim/modules        .vim/modules
        $DOTDIR/Xresources         .Xresources
        $DOTDIR/tmux.conf          tmux.conf
        $DOTDIR/mutt/muttrc        .muttrc
        $DOTDIR/mutt/signature     .signature
        $DOTDIR/bashrc             .bashrc
        $DOTDIR/gitconfig          .gitconfig
        $DOTDIR/gitignore_global   .gitignore_global
        $DOTDIR/nethackrc          .nethackrc
)

old_dotfiles=()

for (( i=0 ; i < ${#link_pairs[@]} ; i+=2 )) do
  if [ -e $HOME/${link_pairs[$i+1]} ]
  then
    echo "Moving old ${link_pairs[$i+1]} to ${link_pairs[$i+1]}.old"
    mv ${link_pairs[$i+1]} ${link_pairs[$i+1]}.old

    old_dotfiles+=(${link_pairs[$i+1]}.old)
  fi

  ln -s ${link_pairs[$i]} $HOME/${link_pairs[$i+1]}
done

# TODO: optionally delete *.old files
