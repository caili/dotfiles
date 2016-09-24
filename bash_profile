if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

export NVM_DIR="$HOME/.nvm"	
. "$(brew --prefix nvm)/nvm.sh"