HOMEDIR=/home/jjin/
DOTDIR=$HOMEDIR/dotfiles

VIMRC=vimrc
GVIMRC=gvimrc

ln -s $DOTDIR/$VIMRC $HOMEDIR/.vimrc
ln -s $DOTDIR/$GVIMRC $HOMEDIR/.gvimrc

mkdir $HOMEDIR/.vim
ln -s $DOTDIR/vim/fn.vim $HOMEDIR/.vim/fn.vim
ln -s $DOTDIR/vim/plug.vim $HOMEDIR/.vim/plug.vim

ln -s $DOTDIR/.Xresources $HOMEDIR/.Xresources
ln -s $DOTDIR/tmux.conf $HOMEDIR/tmux.conf
