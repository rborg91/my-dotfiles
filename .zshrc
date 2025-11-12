# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Set up the prompt

autoload -Uz promptinit
promptinit
prompt adam1

setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

source ~/powerlevel10k/powerlevel10k.zsh-theme
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Use Vim as default text editor
export EDITOR=vim

######################################

# ALIAS COMMANDS

# go to Downloads directory (symlink)
alias downloads='cd ~/downloads'

# close terminal
alias e='exit'

# open current directory in Windows Explorer
alias folder='explorer.exe .'

# get git status
alias gg='git status'

# list all files in directory
alias l='ls -F1'

# list all files in directory including hidden files
alias la='ls -A'

# list directories including hidden ones
alias ldir='ls -alhd */'

# list detailed info on files only in directory
alias lf="ls -alh | egrep -v '^d'"

# list detailed info on all files and directories including hidden
alias ll='ls -alFh'

# open a file in default app from CLI
alias open="wslview"

# poetry run python
alias pp='poetry run python'

# clear terminal
alias q='clear'

# go to repos folder (symlink)
alias repos='cd ~/repos'

# go to Windows user directory (symlink)
alias windows='cd ~/windows'

########################################

# help alias in alphabetical order
alias help='echo "downloads ..... - go to Downloads directory" && \
echo "e ............. - close terminal" && \
echo "folder ........ - open current directory in Windows Explorer" && \
echo "gg ............ - get git status" && \
echo "l ............. - list all files in directory" && \
echo "la ............ - list all files in directory including hidden files" && \
echo "ldir .......... - list directories including hidden ones" && \
echo "lf ............ - list detailed info on files only in directory" && \
echo "ll ............ - list detailed info on all files and directories including hidden" && \
echo "open .......... - open a file in default app from CLI" && \
echo "pp ............ - poetry run python" && \
echo "q ............. - clear terminal" && \
echo "repos ......... - go to repos folder" && \
echo "windows ....... - go to Windows user directory"'


########################################

# Store private settings in a file called .zshrc.local

if [ -f "$HOME/.zshrc.local" ]; then
  source "$HOME/.zshrc.local"
fi
