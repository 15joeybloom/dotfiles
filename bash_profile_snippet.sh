if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
if [ -f ~/.bash_aliases ]; then
    . ~/.opploans_aliases
fi
if [ -f ~/.bash_prompt ]; then
    . ~/.bash_prompt
    export PS1=`get_iterm2_prompt`
fi
