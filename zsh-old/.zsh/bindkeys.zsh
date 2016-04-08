# To see the key combo you want to use just do:
# cat > /dev/null
# And press it

bindkey "^K"      kill-whole-line                      # ctrl-k
bindkey "^R"      history-incremental-search-backward  # ctrl-r
bindkey "^A"      beginning-of-line                    # ctrl-a  
bindkey "^E"      end-of-line                          # ctrl-e
bindkey "[B"      history-search-forward               # down arrow
bindkey "[A"      history-search-backward              # up arrow
bindkey "^[[3~"   delete-char                          # delete
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey -v                                             # vim bindings
bindkey '^_'      undo                                 # ctrl-_ to undo expansion
