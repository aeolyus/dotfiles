#!/bin/bash
echo "Setting up dotfiles..."

cp git/.gitconfig ~/.gitconfig
echo "Copied .gitconfig"

cp vim/.vimrc ~/.vimrc
echo "Copied .vimrc"

echo "Done!"