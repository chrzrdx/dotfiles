#source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
autoload -U colors && colors
PROMPT='%(?,%{$fg_bold[red]%},%{$fg_bold[red]%}) %% %b'
RPS1='%{$fg_bold[yellow]%}%~%{$reset_color%} '
#RPS1='%{$fg[white]%}%2~%{$fg_bold[blue]%} %m%{$reset_color%}'
ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[yellow]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX=")%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%} ⚡%{$fg[yellow]%}"
