# PROMPT="$:%30<..<%~ > "
setopt PROMPT_SUBST
# PROMPT=$'%{$fg_bold[green]%}%n %{$reset_color%}%{$fg_bold[blue]%}%~%{$reset_color%}%{$fg[blue]%} >%{$fg_bold[blue]%}%{$reset_color%} '
PROMPT=$'%{$fg_bold[green]%}%n %{$reset_color%}%{$fg_bold[blue]%}$(showone)%{$reset_color%}%{$fg[blue]%} $%{$fg_bold[blue]%}%{$reset_color%} '

function showone() {
    echo ${${:-/${(j:/:)${(M)${(s:/:)${(D)PWD:h}}#(|.)[^.]}}/${PWD:t}}//\/~/\~} | sed -e 's/^\/h\/'$(id -un)'/~/' | sed -e 's#^//#/#'
}

#PROMPT=$'\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$'


# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=1000
setopt autocd extendedglob
setopt always_to_end	# le curseur part a la fin apres la completion
setopt no_hup		# On ne tue pas les sous-process ...
setopt no_check_jobs	# ... en sortant

# Binkeys
bindkey -e
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# End of lines configured by zsh-newuser-install

# The following lines were added by compinstall
zstyle :compinstall filename '/home/jean/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

#Aliases
if [ -f ~/.zsh_aliases ]; then
    . ~/.zsh_aliases
fi

autoload -U colors && colors

# set PATH so it includes user's private bin if it exists
if [ -d ~/bin ] ; then
      export PATH="${HOME}/bin:/sbin:${PATH}"
fi
export PATH=/usr/sbin:$PATH

# load autojump
if [ -f /usr/share/autojump/autojump.zsh ]; then
  . /usr/share/autojump/autojump.zsh
fi

# Affichage automatique du repertoire dans la 
# barre de titre du terminal
chpwd() {
  [[ -t 1 ]] || return
  case $TERM in
     *xterm*|rxvt|rxvt-unicode|(dt|k|E)term) print -Pn "\e]2;%n@%m%%%~\a"
      ;;
  esac
}

chpwd

# Load zsh-autosuggestions;
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null

# Load zsh-completions;
source /usr/share/zsh-completions/zsh-completions.plugin.zsh 2>/dev/null

# Load zsh-syntax-highlighting; should be last.
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null

# for firefox, so that the touchscreen works like on smartphones
export MOZ_USE_XINPUT2=1
