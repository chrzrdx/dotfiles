source ~/.zsh/history.zsh
source ~/.zsh/bindkeys.zsh
source ~/.zsh/alias.zsh
source ~/.zsh/bindkeys.zsh
source ~/.zsh/colors.zsh
source ~/.zsh/completions.zsh
source ~/.zsh/exports.zsh
source ~/.zsh/functions.zsh
source ~/.zsh/history.zsh
source ~/.zsh/setopt.zsh
#source ~/.zsh/prompt.zsh

fpath=( "$HOME/.zsh/functions" $fpath )
autoload -U promptinit && promptinit
prompt pure

source ~/.zsh/plugins/grep.zsh


if [[ $TERM == xterm-termite ]]; then
  . /etc/profile.d/vte.sh
  __vte_osc7
fi

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/base16-brewer.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

PATH=$PATH:$HOME/.cabal/bin
PATH=$HOME/bin:$PATH
export PATH
