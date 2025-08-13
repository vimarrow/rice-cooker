# Do imports if necessary:
# . "$HOME/.cargo/env"
# PATH="$PATH:/home/vimarrow/go/bin"
# Useful aliases
alias h='fc -l'
alias m="$PAGER"
alias ll='ls -lhaFo --color=auto'
alias g='egrep -i'
alias gst='git status'
 
# # csh like history on arrow up and down
# bind ^[[A ed-search-prev-history
# bind ^[[B ed-search-next-history

# # ctrl+arrow allow to jump from words to words
# bind "\\e[1;5C" em-next-word
# bind "\\e[1;5D" ed-prev-word

parse_git_branch() {
	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

# set prompt: ``username@hostname:directory (git branch)$ '' 
PS1="\u@\h:\w $(parse_git_branch)\\$ "
