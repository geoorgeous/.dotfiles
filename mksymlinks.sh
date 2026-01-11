#! bin/bash

SCRIPT=$(realpath "$0")
SCRIPTPATH=$(dirname "$SCRIPT")

ln -sf $SCRIPTPATH/.gitconfig $HOME/
ln -sf $SCRIPTPATH/.zshrc $HOME/
ln -sf $SCRIPTPATH/nvim $HOME/.config/
ln -sf $SCRIPTPATH/kitty $HOME/.config/
ln -sf $SCRIPTPATH/dconf $HOME/.config/
