#/bin/bash

PREREQS="zsh git vim"
TIMESTAMP=$(date +%s)
DIR="$( cd "$( dirname "$0" )" && pwd )"

[[ brew ]] && brew update && brew install mercurial $PREREQS
[[ apt-get ]] && sudo apt-get update && sudo apt-get install $PREREQS rake
[[ yum ]] && sudo yum update && sudo yum install $PREREQS rake

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
