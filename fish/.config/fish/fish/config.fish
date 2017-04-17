eval (direnv hook fish)

# exports
set -gx LC_CTYPE en_US.UTF-8
set -gx LC_ALL en_US.UTF-8
set -gx EDITOR nvim
set -gx PAGER less
set -gx TERM xterm-256color

set -gx PATH $PATH /usr/local/sbin /usr/local/bin ~/opt/bin
