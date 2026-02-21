# set -x
if [ -z "$LAUNCHCTL_ENV_SET" ]; then
    launchctl setenv WEZTERM_CONFIG_FILE /Users/jwfeng/.config/wezterm/wezterm.lua
    launchctl setenv KAKU_CONFIG_FILE /Users/jwfeng/.config/kaku/kaku.lua
fi
export PATH=$HOME/.local/bin:$PATH
export LD_LIBRARY_PATH=$HOME/.local/lib:$LD_LIBRARY_PATH
export LANG=en_US.UTF-8
export PATH=$PATH:/usr/local/go/bin
export PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"
export EDITOR=nvim
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#f8f8f2,bg=#1a1d23,bold,underline"

plugins=(
    # git
    vi-mode
    zsh-syntax-highlighting
    # last-working-dir
    zsh-autosuggestions
    )
#
source "$HOME/.oh-my-zsh"/oh-my-zsh.sh
bindkey ',' autosuggest-accept

# vi-mode configuration
# Make Vi mode transitions faster (KEYTIMEOUT is in hundredths of a second)
export KEYTIMEOUT=1
# bindkey "^[OA" up-line-or-beginning-search
# bindkey "^[OB" down-line-or-beginning-search
bindkey -M vicmd "k" up-line-or-beginning-search
bindkey -M vicmd "j" down-line-or-beginning-search

export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
export HOMEBREW_BREW_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git"
export HOMEBREW_CORE_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git"
export HOMEBREW_API_DOMAIN="https://mirrors4.tuna.tsinghua.edu.cn/homebrew-bottles/api"
export HOMEBREW_BOTTLE_DOMAIN="https://mirrors4.tuna.tsinghua.edu.cn/homebrew-bottles"
source $HOME/.my_alias

eval $(dircolors -b $HOME/.dir_colors)

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/Caskroom/miniconda/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/Caskroom/miniconda/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
# proxy_on
eval "$(zoxide init zsh)"
# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Mole shell completion
if output="$(mole completion zsh 2>/dev/null)"; then eval "$output"; fi
export HOSTNAME=$(hostname)

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/jwfeng/.lmstudio/bin"
eval "$(starship init zsh)"
