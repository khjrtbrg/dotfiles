#!/bin/sh

echo "✨ Welcome! ✨"

cd `dirname $0`
F=`pwd |sed -e "s#$HOME/\?##"`

for P in *
do
  # skip gitignore and README
  if [[ "$P" == .gitignore ]]; then continue; fi
  if [[ "$P" == README.md ]]; then continue; fi

  # ensure permissions
  chmod -R o-rwx,g-rwx $P

  # skip existing links
  if [ -h "$HOME/.$P" ]; then continue; fi

  # move existing dir out of the way
  if [ -e "$HOME/.$P" ]; then
    echo -n "Backup "
    mv -v "$HOME/.$P" "$HOME/__$P"
  fi

  # create link
  echo -n "Link "
  ln -v -s "$F/$P" "$HOME/.$P"
done

# set up gitconfig_private
echo "Enter an email for git: "
read git_email

echo "Enter a name for git: "
read git_name

echo "
[user]
  email = $git_email
  name = $git_name
" > $HOME/gitconfig_private

# install brew
which -s brew
if [[ $? != 0 ]] ; then
  echo "Installing brew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
else
  echo "Updating brew..."
  brew update
fi

# install brew packages
echo "Installing a few brew packages..."
brew install the_silver_searcher
brew install autojump
brew install tree
brew install jq
brew cask install sublime-text

# install nvm
echo "Installing nvm..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash

# install vundle
echo "Installing vundle..."
git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim

# install fonts
if [ -h "$HOME/dotfiles/vim/fonts" ]; then
  continue;
else
  echo "Installing vim powerline fonts..."
  git clone https://github.com/powerline/fonts.git $HOME/.vim/fonts
  $HOME/.vim/fonts/install.sh
fi

# set up subl command
echo "Linking subl command"
ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" ~/bin/subl

echo "
Set up is mostly complete! To finish up:

1. Pick a terminal theme and set it as default.
2. Add 'nvm.sh --no-use' to wherever it was set up to avoid lag
3. Finish setting up with :PluginInstall
4. Remember to generate and add ssh keys: https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/
"
