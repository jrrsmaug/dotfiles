#
# Executes commands at the start of an interactive session.
#
#AGKOZAK_PROMPT_DEBUG=1

### Added by Zplugin's installer
source "$HOME/.zplugin/bin/zplugin.zsh"
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin
### End of Zplugin's installer chunk

zstyle ':prezto:*:*' color 'yes'
zplugin ice svn silent; zplugin snippet PZT::modules/environment
zplugin ice svn silent; zplugin snippet PZT::modules/terminal
zplugin ice svn silent; zplugin snippet PZT::modules/editor
zplugin ice svn silent; zplugin snippet PZT::modules/history
zplugin ice svn silent; zplugin snippet PZT::modules/directory
zplugin ice svn silent; zplugin snippet PZT::modules/spectrum
zplugin ice svn silent; zplugin snippet PZT::modules/utility
zplugin ice svn silent; zplugin snippet PZT::modules/completion
zplugin ice svn silent; zplugin snippet PZT::modules/git
#zstyle ':prezto:module:prompt' theme steeef
#zplugin snippet PZT::modules/helper/init.zsh
#zplugin ice svn silent; zplugin snippet PZT::modules/prompt
zplugin ice svn silent; zplugin snippet OMZ::plugins/mvn
zplugin light "zsh-users/zsh-completions"
zplugin light "zsh-users/zsh-autosuggestions"
autoload -Uz compinit
compinit
zplugin light "agkozak/agkozak-zsh-prompt"
zplugin light "zsh-users/zsh-history-substring-search"
#zplugin light "zsh-users/zsh-syntax-highlighting"
zplugin light "zdharma/fast-syntax-highlighting"
zplugin light "psprint/zsh-select"
zplugin light "psprint/history-search-multi-word"
zplugin light "hkupty/ssh-agent"

# Color output (auto set to 'no' on dumb terminals).

# Set the prompt theme to load.
# Setting it to 'random' loads a random theme.
# Auto set to 'off' on dumb terminals.

# Windows
zstyle ':completion:*' fake-files   '/:c' '/:d' '/:e' '/:p' '/:s'

zstyle ':omz:plugins:ssh-agent' identities 'private-id_rsa' 'nov015223-ossh' 'nov013462-ossh'

#zstyle ':prezto:module:terminal' auto-title 'yes'

AGKOZAK_PROMPT_DIRTRIM=4
#AGKOZAK_LEFT_PROMPT_ONLY=1

AGKOZAK_CUSTOM_PROMPT='%(?..%B%F{red}(%?%)%f%b )'
AGKOZAK_CUSTOM_PROMPT+='%(!.%S%B.%B%F{green})%n%1v%(!.%b%s.%f%b) '
AGKOZAK_CUSTOM_PROMPT+=$'%B%F{blue}%2v%f%b%(3V.%F{yellow}%3v%f.)\n'
AGKOZAK_CUSTOM_PROMPT+='%(4V.:.%#) '

AGKOZAK_CUSTOM_RPROMPT='%F{blue}%*%f'


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
#  $(ruby -rubygems -e "puts Gem.user_dir")/bin
path=(
  /usr/local/{bin,sbin}
  ~/emacs/bin
  "/c/Program Files/Sublime Text 3"
  "/c/Program Files/nodejs"
  $path
)

export SHELL=/usr/bin/zsh

# thanks to:  http://blog.blindgaenger.net/colorize_maven_output.html
# and: http://johannes.jakeapp.com/blog/category/fun-with-linux/200901/maven-colorized
# Colorize Maven Output
alias maven="command mvn"
function color_maven() {
    local DARK_GRAY="[1;30m"
    local RED="[0;31m"
    local LIGHT_RED="[1;31m"
    local GREEN="[0;32m"
    local YELLOW="[1;32m"
    local PINK="[0;33m"
    local ORANGE="[1;33m"
    local BLUE="[0;34m"
    local LIGHT_BLUE="[1;34m"
    local PURPLE="[0;35m"
    local MAGENTA="[1;35m"
    local DARK_CYAN="[0;36m"
    local LIGHT_CYAN="[1;36m"
    local LIGHT_GRAY="[0;37m"
    local WHITE="[1;37m"
    local NO_COLOUR="[0m"
    maven "$@" | sed \
        -e "s/Tests run: \([^,]*\), Failures: \([^,]*\), Errors: \([^,]*\), Skipped: \([^,]*\)/${LIGHT_GREEN}Tests run: \1$NO_COLOUR, Failures: $RED\2$NO_COLOUR, Errors: $YELLOW\3$NO_COLOUR, Skipped: $LIGHT_BLUE\4$NO_COLOUR/g" \
        -e "s/\(\[\{0,1\}WARN\(ING\)\{0,1\}\]\{0,1\}.*\)/$ORANGE\1$NO_COLOUR/g" \
        -e "s/\(\[ERROR\].*\)/$RED\1$NO_COLOUR/g" \
        -e "s/\(\(BUILD \)\{0,1\}FAILURE.*\)/$RED\1$NO_COLOUR/g" \
        -e "s/\(\(BUILD \)\{0,1\}SUCCESS.*\)/$GREEN\1$NO_COLOUR/g" \
        -e "s/\(\[INFO\].*\)/$LIGHT_GRAY\1$NO_COLOUR/g" \
        -e "s/\(\[INFO\]\)\( ---.*---\)/$LIGHT_GRAY\1$LIGHT_CYAN\2$NO_COLOUR/g" \
        -e "s/\(Building\)\(.*\)/\1$YELLOW\2$NO_COLOUR/g"
    return $PIPESTATUS
}

# aliases
alias mvn=color_maven

alias gws='git status --ignore-submodules=${_git_status_ignore_submodules} --short -b'
alias gll="gl -6"
alias mci="mvn clean install"

alias env-elementar=". ~/.env/elementar.sh"
alias env-elementar-pkg=". ~/.env/elementar-pkg.sh"
alias env-vjames=". ~/.env/vjames.sh"
alias env-encores=". ~/.env/encores.sh"

function doin() {
  local YELLOW="[1;32m"
  local NO_COLOUR="[0m"
  if [ ! -d "$1" ]; then
    echo "Directory does not exist"; return
  fi
  echo $YELLOW$1$NO_COLOUR
  pushd "$1" > /dev/null
  shift
  eval "$@"
  if [[ "$?" -ne 0 ]] ; then
    echo "Failed command"; return
  fi
  popd > /dev/null
}
alias d=doin

function forall() {
  for d in */ ; do
    doin "$d" $@
  done
}
alias f=forall
