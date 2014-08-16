#!/bin/sh

DIR="$(cd "$(dirname "$0")" && pwd)"

mv ~/.gitconfig ~/.gitconfig.old-$TIMESTAMP
mv ~/.vimrc.after ~/.vimrc.after.old-$TIMESTAMP
mv ~/.tmux.conf ~/.tmux.conf.old-$TIMESTAMP

ln -sf $DIR/.gitconfig ~/.gitconfig
ln -sf $DIR/.vimrc.after ~/.vimrc.after
ln -sf $DIR/.tmux.conf ~/.tmux.conf

./update.sh
