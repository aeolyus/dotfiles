#!/usr/bin/env sh

while IFS= read -r line; do
  echo "Installing vscode extension $line"
  code --install-extension $line
done < ~/dotfiles/vscode/.config/Code\ \-\ OSS/User/extensions.txt
