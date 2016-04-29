bindkey '^o' beginning-of-line
bindkey '^v' end-of-line
bindkey '^t' backward-char
bindkey '^n' forward-char

bindkey '\et' backward-word
bindkey '\en' forward-word

bindkey '^s' up-line-or-history
bindkey '^r' down-line-or-history        

function _kill-whole-line {
            zle beginning-of-line
            zle kill-line
        }

zle -N _kill-whole-line        
bindkey '^g' _kill-whole-line
