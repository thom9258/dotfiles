#!/bin/bash

DOT_DIR="$HOME/dotfiles"

ln -sfn $DOT_DIR/emacs/init.el    $HOME/.emacs.d/init.el
ln -sfn $DOT_DIR/emacs/config.org $HOME/.emacs.d/config.org
ln -sfn $DOT_DIR/bash/bashrc.sh   $HOME/.bashrc
ln -sfn $DOT_DIR/qtile            $HOME/.config/qtile
ln -sfn $DOT_DIR/nvim             $HOME/.config/nvim
ln -sfn $DOT_DIR/zathura          $HOME/.config/zathura

# Add bash helper scripts to path



# TODO: Make a loop for this
#SYM_SRCS=("qtile" ".bashrc")
#SYM_DSTS=("$HOME/.config/qtile" "$HOME/.bashrc")
#
#for i in "${!SYM_SRCS[@]}"
#do 
#	echo "Symlinking source $i -> $DOT_DIR${!SYM_SRCS[$i]}"
#done


