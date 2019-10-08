# Configuring Our Prompt
# ======================

# if you install git via homebrew, or install the bash autocompletion via homebrew, you get __git_ps1 which you can use in the PS1
# to display the git branch.  it's supposedly a bit faster and cleaner than manually parsing through sed. i dont' know if you care
# enough to change it

# This function is called in your prompt to output your active git branch.
function parse_git_branch {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# This function builds your prompt. It is called below
function prompt {
    # Define some local colors
    local         RED="\[\033[0;31m\]" # This syntax is some weird bash color thing I never
    local   LIGHT_RED="\[\033[1;31m\]" # really understood
    local        CHAR="> "

    # Here is where we actually export the PS1 Variable which stores the text for your prompt
    export PS1="\[\e]2;\u@\h\a[\[\e[37;44;1m\]\t\[\e[0m\]]$RED\$(parse_git_branch) \[\e[32m\]\W\[\e[0m\]\n\[\e[0;31m\]$CHAR \[\e[0m\]"
}

# Finally call the function and our prompt is all pretty
prompt

# For more prompt coolness, check out Halloween Bash:
# http://xta.github.io/HalloweenBash/

# If you break your prompt, just delete the last thing you did.
# And that's why it's good to keep your dotfiles in git too.


# Aliases I actually use...
alias repo='cd ~/code/SEI-CC-4'
alias ..='cd ..'
alias ls='ls -al'
alias ia="open $1 -a /Applications/iA\ Writer.app"
alias launch="osascript -l JavaScript ~/.start-work.scpt"






# Aliases I don't use but will keep around for reference
# alias paid-session="osascript -l JavaScript ~/.paid-session.scpt"
# alias paid-staging="ssh -i ~/.ssh/id_rsa capistrano@staging-www-01"

export EDITOR="code"
eval "$(rbenv init -)"
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin

export NVM_DIR="/Users/brock/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# added by Anaconda2 5.2.0 installer
export PATH="/anaconda2/bin:$PATH"

# Setting PATH for Python 3.7
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.7/bin:${PATH}"
export PATH

# added by MongoDB
export PATH="/usr/local/opt/mongodb@3.0/bin:$PATH"
