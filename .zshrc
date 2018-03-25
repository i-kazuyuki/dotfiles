# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

plugins=(git ssh-agent ruby gem zsh-syntax-highlighting)

# 重複パスを登録しない
typeset -U path cdpath fpath manpath
# sudo用のpathを設定
typeset -xT SUDO_PATH sudo_path
typeset -U sudo_path
sudo_path=({/usr/local,/usr,}/sbin(N-/))
# rbenvのpathを設定
export PATH="/Users/kazuyuki/.rbenv/shims:/usr/local/bin:$PATH"

# vimを開くためのエイリアス
alias vf='vim +VimFiler'
alias vu='vim +Unite'
alias vn='vim +NERDTree'
alias lsc='colorls'

# MacVimへのPATHとエイリアス
PATH=”/Applications/MacVim.app/Contents/MacOS:$PATH”
alias mvim=/Applications/MacVim.app/Contents/MacOS/Vim
alias mvn='mvim +NERDTree'

# ------------------------------------------------------------------------
# anyenv  PATHの設定
# ------------------------------------------------------------------------
if [ -d $HOME/.anyenv ] ; then
    export PATH="$HOME/.anyenv/bin:$PATH"
    eval "$(anyenv init -)"
    for D in `ls $HOME/.anyenv/envs`
    do
        export PATH="$HOME/.anyenv/envs/$D/shims:$PATH"
    done
fi

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#

# Path to your oh-my-zsh installation.
export ZSH=/Users/kazuyuki/.oh-my-zsh
plugins=(git colorize bundler)
source $ZSH/oh-my-zsh.sh

# auto-fu.zsh
source $HOME/.zsh/auto-fu.zsh/auto-fu.zsh
function zle-line-init(){
    auto-fu-init
}
zle -N zle-line-init
# 「-azfu-」を表示させない
zstyle ':auto-fu:var' postdisplay $''

# powerlevel9k
POWERLEVEL9K_MODE='awesome-fontconfig'
ZSH_THEME="powerlevel9k/powerlevel9k"
# ZSH_THEME="self_made_theme" 前に作った自作theme
source  ~/powerlevel9k/powerlevel9k.zsh-theme
POWERLEVEL9K_MODE='Awesome Powerline'
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
DEFAULT_USER=kazuyuki
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir dir_writable root_indicator ssh vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status time)
POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_RPROMPT_ON_NEWLINE=false
POWERLEVEL9K_STATUS_OK_BACKGROUND="clear"
POWERLEVEL9K_STATUS_OK_FOREGROUND="green"
POWERLEVEL9K_STATUS_ERROR_BACKGROUND="clear"
POWERLEVEL9K_STATUS_ERROR_FOREGROUND="red"
POWERLEVEL9K_TIME_BACKGROUND="clear"
POWERLEVEL9K_TIME_FOREGROUND="249"
POWERLEVEL9K_TIME_FORMAT="%D{%H:%M} \uF017"
POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR=''
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="╭"
#POWERLEVEL9K_MULTILINE_SECOND_PROMPT_PREFIX="❱ "
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="╰ $ "

# For a full list of supported colors, run this little code in your terminal:
# for code ({000..255}) print -P -- "$code: %F{$code}This is how your text would look like%f"
# `git hub colors`
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='yellow'
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='black'
POWERLEVEL9K_VCS_CLEAN_FOREGROUND='black'
POWERLEVEL9K_VCS_CLEAN_BACKGROUND='151'

