name mkcd()
{
  mkdir -p "$@" && cd "$_";
}
alias nv="nvim"
alias c="clear"
alias ls="lsd"
alias ..="cd .."
alias lg="lazygit"
alias co="g++ -std=c++23 -O2 -Wall a.cpp -o a"
alias checklinux='for i in 1 2 3 4 5 6 7; do echo -n "linux$i: "; ssh sabinoc@linux$i.cs.uchicago.edu uptime; done'
alias t="tmux"
alias ta="tmux attach-session"
alias td="tmux det"
alias nk='NVIM_APPNAME=kickstart-nvim nvim' # Kickstart
alias nl='NVIM_APPNAME=lazy_nvim nvim'
alias sz='source ~/.zshrc'
alias ez='nv ~/.zshrc'

# alias tn="tmux new -s (pwd | sed 's/.*\///g')"
# alias mkcd='mkdir -p "$1" && cd "$1"'
tn() { tmux new -s "$(pwd | sed 's/.*\///g')"; }
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

export PATH="/Users/charliesabino/.local/bin:$PATH"
export XDG_CONFIG_HOME="$HOME/.config"

# Load and initialise completion system
autoload -Uz compinit
compinit
export PATH="/usr/local/texlive/2025/bin/universal-darwin/:$PATH"
export PATH="/opt/homebrew/opt/protobuf@21/bin:$PATH"

if [ -f ~/.env ]; then
  source ~/.env
fi

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

zinit ice depth=1
zinit light jeffreytse/zsh-vi-mode
zinit light zsh-users/zsh-autosuggestions
zi light z-shell/F-Sy-H # syntax highlighting

### End of Zinit's installer chunk

. "$HOME/.atuin/bin/env"

eval "$(atuin init zsh --disable-up-arrow)"

