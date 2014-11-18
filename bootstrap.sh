HOMEDIR=/home/jjin/
DOTDIR=$HOMEDIR/dotfiles

ln -s $DOTDIR/vimrc $HOMEDIR/.vimrc
ln -s $DOTDIR/gvimrc $HOMEDIR/.gvimrc

mkdir $HOMEDIR/.vim
ln -s $DOTDIR/vim/fn.vim $HOMEDIR/.vim/fn.vim
ln -s $DOTDIR/vim/plug.vim $HOMEDIR/.vim/plug.vim
