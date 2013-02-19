#/bin/bash

PREREQS="zsh git vim rake"
TIMESTAMP=$(date +%s)
DIR="$( cd "$( dirname "$0" )" && pwd )"

[[ brew ]] && sudo brew install $PREREQS
[[ apt-get ]] && sudo apt-get install $PREREQS
[[ yum ]] && sudo yum install $PREREQS

chsh -s /bin/zsh

curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
curl -Lo- https://bit.ly/janus-bootstrap | bash

git submodule init

mv ~/.janus ~/.janus.old-$TIMESTAMP
mv ~/.gitconfig ~/.gitconfig.old-$TIMESTAMP
mv ~/.vimrc.after ~/.vimrc.after.old-$TIMESTAMP

ln -sf $DIR/.janus ~/.janus
ln -sf $DIR/.gitconfig ~/.gitconfig
ln -sf $DIR/.vimrc.after ~/.vimrc.after

./update.sh
