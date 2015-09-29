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
source ~/.zsh/prompt.zsh

source ~/.zsh/plugins/grep.zsh

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/base16-brewer.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

PATH=$PATH:$HOME/.cabal/bin
PATH=$HOME/bin:$PATH
export PATH
