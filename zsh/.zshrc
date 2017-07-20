#
# Executes commands at the start of an interactive session.
#

# Source zplug.
source ~/.zplug/init.zsh

zplug "modules/environment", from:prezto
zplug "modules/terminal", from:prezto
zplug "modules/editor", from:prezto
zplug "modules/history", from:prezto
zplug "modules/directory", from:prezto
zplug "modules/spectrum", from:prezto
zplug "modules/utility", from:prezto
zplug "modules/completion", from:prezto
zplug "modules/git", from:prezto
zplug "modules/ruby", from:prezto
zplug "modules/syntax-highlighting", from:prezto
zplug "modules/history-substring-search", from:prezto
#zplug "modules/autosuggestions", from:prezto
zplug "modules/prompt", from:prezto
zplug "hkupty/ssh-agent"
zplug "psprint/history-search-multi-word"

# Color output (auto set to 'no' on dumb terminals).
zstyle ':prezto:*:*' color 'yes'

# Set the key mapping style to 'emacs' or 'vi'.
zstyle ':prezto:module:editor' key-bindings 'emacs'

# Set the prompt theme to load.
# Setting it to 'random' loads a random theme.
# Auto set to 'off' on dumb terminals.
zstyle ':prezto:module:prompt' theme 'steeef'

# Windows
zstyle ':completion:*' fake-files   '/:c' '/:d' '/:e' '/:p' '/:s'

zstyle ':omz:plugins:ssh-agent' identities 'private-id_rsa' 'nov015223-ossh' 'nov013462-ossh'

#zstyle ':prezto:module:terminal' auto-title 'yes'


# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load --verbose


# Customize to your needs...
export TERM=xterm-256color
if [ -f ~/.mycolors ] ; then
  eval "$(dircolors ~/.mycolors)";
fi

export EDITOR=subl

alias edit="subl"
alias gll="gl -6"
alias ll="ls -lha"

# slap a title on tmux
titledmux() { set-window-title $2 ; tmuxinator "$@" ; }
alias mux=titledmux

alias tmux="TERM=xterm-256color tmux"

# maven aliases
alias mvn="mvn -Djava.io.tmpdir=$TMP"
alias mci="mvn clean install"

git-svn-reintegrate-branch() {
  git checkout master && git svn rebase && git checkout "$1" && git rebase master && git checkout master && git merge "$1"
}

check-only() {
  grep -R "it\.only" encores-apgonline/apgonline-frontend/test/.
  grep -R "describe\.only" encores-apgonline/apgonline-frontend/test/.
}

alias killnode='taskkill -IM node.exe -f && taskkill -IM phantomjs.exe -f'
theend () {
  taskkill -IM node.exe -f
  taskkill -IM phantomjs.exe -f
  taskkill -IM java.exe -f
  tmux kill-session -t apgon
}

# Set the list of directories that Zsh searches for programs.
path=(
  /usr/local/{bin,sbin}
  ~/emacs/bin
  "/c/Program Files/Sublime Text 3"
  "/c/Program Files/nodejs"
  $(ruby -rubygems -e "puts Gem.user_dir")/bin
  $path
)

export SHELL=/usr/bin/zsh

