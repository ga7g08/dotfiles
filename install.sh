#!/bin/bash

# To be used at initial setup only. If the files already exist a simple warning
# is issued and no action taken. It is up to the user to delete the file and
# rerun this script to properly install

# Get current dir (so run this script from anywhere)
export DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Update dotfiles itself first
[ -d "$DOTFILES_DIR/.git" ] && git --work-tree="$DOTFILES_DIR" --git-dir="$DOTFILES_DIR/.git" pull origin master

# Setup symlinks - if they already exist just print a warning
if [ -f ~/.bashrc ]; then
    echo "WARNING: ~/.bashrc already exists: no action taken"
else
    ln -sfv "$DOTFILES_DIR/.bashrc" ~
fi

if [ -f ~/.gitconfig ]; then
    echo "WARNING: ~/.gitconfig already exists: no action taken"
else
    ln -sfv "$DOTFILES_DIR/.gitconfig" ~
fi

if [ -f ~/.screenrc ]; then
    echo "WARNING: ~/.screenrc already exists: no action taken"
else
    ln -sfv "$DOTFILES_DIR/.screenrc" ~
fi

if [ -f ~/.dir_colors ]; then
    echo "WARNING: ~/.dir_colors already exists: no action taken"
else
    ln -sfv "$DOTFILES_DIR/.dir_colors" ~
fi


# vim setup
if [ -d ~/.vim ]; then
  echo "WARNING: ~/.vim already exist: no action taken"
else
  ln -sfv "$DOTFILES_DIR/.vim" ~

  # Install Vundle
  echo "Set up vim, Vundle and install plugins"
  cd ~/.vim
  ./InstallVundle
  vim +PluginInstall +qall

  # Install Powerline fonts
  ./InstallPowerlineFonts
fi

# ipython setup
if [ -f ~/.ipython/profile_default/ipython_config.py ]; then
    echo "WARNING: .ipython/profile_default/ipython_config.py already exists: no action taken"
else
    ln -sfv "$DOTFILES_DIR/ipython_config.py" ~/.ipython/profile_default
fi
